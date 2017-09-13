module ApplicationHelper
  include Surveyor::Helpers::SurveyorHelperMethods
  include SurveyorGui::Helpers::SurveyorGuiHelperMethods
  include DeviseHelper

  def office_name
    hcode5 = current_user.email.split('@').last
    office = Admin.find_by_hcode5(hcode5)
    office.offname
  end

  def office_hcode5
    current_user.email.split('@').last
  end

  def thai_time(tm)
    return tm if tm == 'In progress'
    tm += 7.hour
    return tm.to_s    
  end
end
