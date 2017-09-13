require 'csv'
require 'pry-nav'

class ResultsController < ApplicationController
  before_action :check_current_user

  helper 'surveyor'
  layout 'results' 

  def index
    @surveys = Survey.all
    respond_to do |format|
      format.html
      format.csv { render text: @surveys.to_csv }
    end
  end

  def q_txt(n)
    Question.find(n).text
  end

  def a_txt(n,s,i)
    a = Answer.find(n).text
    a = s if a == "String"
    a = i if a == "Integer" or a.include?('|')
    a
  end

  def show
    if current_user.email =~ /\d{13}@\d{5}/ # HAPPINO survey result
      # find response_set_id from user_id
      rs_id = ResponseSet.find_by_user_id(current_user.id)

      # find responses from response_set_id
      @rr = Response.where(["response_set_id = ?", rs_id]).order(:question_id)

      @questions = []
      @responses = []

      (0...@rr.count).each do |n|
        q_id = @rr[n].question_id
        a_id = @rr[n].answer_id
        s = @rr[n].string_value
        i = @rr[n].integer_value
        begin
          @questions.push(q_txt(q_id))
          @responses.push(a_txt(a_id,s,i))
        rescue
          puts "ERROR"
          puts "q_id: #{q_id}"
          puts "a_id: #{a_id}"
          next
        end
      end
    else # HPI survey result by admin
      @questions = []
      @responses = []
      hpi = HpiSurvey.find_by_email(current_user.email)
      if !hpi.nil?
        hash = hpi.attributes
        oldref = nil
        oldans = nil
        i = 0
        hash.each_pair do |k,v|
          if k !~ /^q_/
            @questions.push(k)
            @responses.push(v)
          else
            if (k.length == 6) # question text
              q_text = HpiQuestion.find_by_reference_identifier(k.split('_').last).text
              a_text = HpiAnswer.find_by_id(v).text
              @questions.push(q_text)
              @responses.push(a_text)
            elsif (k.length == 7) # question with multiple answers
              # PENDING !!!
            end
          end
        end
      else
        @questions = []
        @responses = []
      end
    end
  end

end
