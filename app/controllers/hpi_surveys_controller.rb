require 'pry-nav'

class HpiSurveysController < ApplicationController
  before_action :set_hpi_survey, only: [:show, :edit, :update, :destroy]
  before_action :check_current_user

  respond_to :html

  def index
    @hpi_surveys = HpiSurvey.all
    respond_with(@hpi_surveys)
  end

  def show
    redirect_to '/hpi/score'
    return
  end

  def new
    if (check_survey == 1)
      @hpi_survey = HpiSurvey.find_by_email(current_user.email)
      render :edit
      return
    end
    @hpi_survey = HpiSurvey.new
    respond_with(@hpi_survey)
  end

  def edit
  end

  def create
    @hpi_survey = HpiSurvey.new(hpi_survey_params)
    flash[:notice] = 'HpiSurvey was successfully created.' if @hpi_survey.save
    redirect_to '/hpi/score'
    return
  end

  def answer_id_to_score(ans_id)
    mod = ans_id.to_s.to_i % 10
    score = 0 if (mod == 4 or mod == 9)
    score = 25 if (mod == 5 or mod == 0)
    score = 50 if (mod == 6 or mod == 1)
    score = 75 if (mod == 7 or mod == 2)
    score = 100 if (mod == 8 or mod == 3)
    score
  end

  def dim_score_avg(from,to)
    @score = 0
    num_q = to - from + 1
    hs = HpiSurvey.where(:user_id => current_user.id)
    return if hs.nil? or hs.length == 0
    (from..to).each do |q_id|
      ref = "q_" + HpiQuestion.where({:id => q_id}).map(&:reference_identifier)[0]
      ans = hs[0][ref].to_s.to_i
      if ans > 0
        mark = answer_id_to_score(ans)
        @score += mark
      end
    end
    score_avg = @score / (num_q * 1.0)
  end

  def hpiscore
    @dims = ["Success","Administration","Body & Mind","Atmosphere","Investment"]
    @dim = []
    @id = nil
    if current_user
      @id = current_user.id
      dim1 = dim_score_avg(107,108)
      dim2 = dim_score_avg(110,114)
      dim3 = dim_score_avg(116,124)
      dim4 = dim_score_avg(126,130)
      dim5 = dim_score_avg(132,137)
      @dim = [dim1,dim2,dim3,dim4,dim5]
    end
  end

  def hpireport
    @dims = ["Success","Administration","Body & Mind","Atmosphere","Investment"]
    @reports = []
    @dim = []
    @id = nil
    admins = User.where(["email LIKE ?",'admin%']).limit(5)    
    admins.each do |admin|
      @id = admin.id
      hc5 = admin.email[-5..-1]
      ona = admin.offname
      oty = admin.offtype
      dept = admin.department
      div = admin.division
      prov = admin.province
      reg = admin.region
      dim1 = dim_score_avg(107,108)
      dim2 = dim_score_avg(110,114)
      dim3 = dim_score_avg(116,124)
      dim4 = dim_score_avg(126,130)
      dim5 = dim_score_avg(132,137)
      data = [dim1,dim2,dim3,dim4,dim5,hc5,ona,oty,dept,div,prov,reg]
      @reports.push(data)
      data = []
    end
  end

  def update
    flash[:notice] = 'HpiSurvey was successfully updated.' if @hpi_survey.update(hpi_survey_params)
    respond_with(@hpi_survey)
  end

  def destroy
    @hpi_survey.destroy
    respond_with(@hpi_survey)
  end

  private
    def set_hpi_survey
      hcode5 = current_user.email.split('@').last
      @hpi_survey = HpiSurvey.find_by_hcode5(hcode5)
    end

    def hpi_survey_params
      params.require(:hpi_survey).permit(:user_id, :email, :hcode5, :q_01011, :q_01012, :q_01013, :q_01014, :q_01015, :q_01016, :q_01017, :q_01018, :q_01021, :q_01022, :q_01023, :q_01031, :q_01032, :q_01033, :q_01034, :q_01035, :q_01036, :q_01037, :q_0201, :q_0202, :q_0203, :q_0204, :q_0205, :q_0206, :q_0207, :q_0208, :q_0209, :q_0210, :q_0211, :q_0212, :q_0213, :q_0214, :q_0215, :q_0216, :q_0217, :q_0218, :q_0219, :q_0220, :q_0221, :q_0222, :q_0223, :q_0224, :q_0225, :q_0226, :q_0227)
    end

    def check_survey
      found = HpiSurvey.where(["email = ?", current_user.email]).count
    end
end
