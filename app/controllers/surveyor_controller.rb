# encoding: UTF-8
module SurveyorControllerCustomMethods
  def self.included(base)
    # base.send :before_filter, :require_user   # AuthLogic
    # base.send :before_filter, :login_required  # Restful Authentication
    base.send :layout, 'surveyor_custom'
    #base.send :before_filter, :store_location
    base.send :before_filter, :authenticate_user!, :only => :new # Devise
  end

  # Actions
  def welcome
  end

  def new
    super
    check_admin
    survey_taken

    if @admin
      redirect_to edit_admin_path(@admin)
    elsif @flag == true
      redirect_to "/surveys/happinometer/#{@taken.first.access_code}"
    elsif @flag == false
      redirect_to "/surveys/happinometer/#{@taken.first.access_code}/take"
    end
  end

  def create
    super
  end

  def show
    super
  end

  def edit
    check_current_user
    super
    # Cannot EDIT finished survey
    #if survey_taken
    #  render :show and return 
    #end


  end

  def update
    super
  end

  def survey_taken
    @flag = nil
    @taken = ResponseSet.select("access_code,completed_at").where(:user_id => current_user.id)
    if @taken.first
      completed = @taken.first.completed_at
      if completed
        @flag = true
      else
        @flag = false
      end
    end
  end

  def check_admin
    if (current_user.email =~ /^admin@\d{5}$/)
      hcode5 = current_user.email.split('@').last
      @admin = Admin.find_by_hcode5(hcode5)
    end
  end

  def answer_id_to_score(ans_id)
    mod = ans_id.to_s.to_i % 10
    score = 0 if (mod == 8 or mod == 3)
    score = 25 if (mod == 9 or mod == 4)
    score = 50 if (mod == 0 or mod == 5)
    score = 75 if (mod == 1 or mod == 6)
    score = 100 if (mod == 2 or mod == 7)
    score
  end

  def dim_score_avg(from,to)
    @score = 0
    num_q = to - from + 1
    survey_id = 1
    rs_id = ResponseSet.select("id").where(:user_id => current_user.id).limit(1).first.id
    (from..to).each do |q|
      ans = Response.select("answer_id").where(
        {:response_set_id => rs_id, :question_id => q}).first
      if !ans.nil?
        mark = answer_id_to_score(ans.answer_id)
        @score += mark
      end
    end
    score_avg = @score / (num_q * 1.0)
  end

  def score
    @dims = ["Happy Body","Happy Relax","Happy Heart",
             "Happy Soul","Happy Family","Happy Society",
             "Happy Brain","Happy Money","Happy Work Life"]
    @dim = []
    @id = nil
    if current_user
      @id = current_user.id
      dim1 = dim_score_avg(24,28)
      dim2 = dim_score_avg(30,34)
      dim3 = dim_score_avg(36,40)
      dim4 = dim_score_avg(42,46)
      dim5 = dim_score_avg(48,50)
      dim6 = dim_score_avg(52,57)
      dim7 = dim_score_avg(59,61)
      dim8 = dim_score_avg(63,66)
      dim9 = dim_score_avg(68,83)
      @dim = [dim1,dim2,dim3,dim4,dim5,dim6,dim7,dim8,dim9]
    end
  end

  def scores(category)
    @dims = ["Happy Body","Happy Relax","Happy Heart",
             "Happy Soul","Happy Family","Happy Society",
             "Happy Brain","Happy Money","Happy Work Life"]
  end

  # Paths
  def surveyor_index
    # most of the above actions redirect to this method
    super # surveyor.available_surveys_path
  end

  def surveyor_finish
    # the update action redirects to this method if given params[:finish]
    super # surveyor.available_surveys_path
    #"/surveyor_gui/reports/1/show"
    "/surveyor/score"
  end

end

class SurveyorController < ApplicationController
  include Surveyor::SurveyorControllerMethods
  include SurveyorControllerCustomMethods
end
