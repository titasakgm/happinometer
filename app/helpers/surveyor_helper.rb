module SurveyorHelper
  #include Surveyor::Helpers::SurveyorHelperMethods
  #include DeviseHelper

  def rc_to_as(type_sym)
    case type_sym.to_s
    when /(integer|float)/ then :string
    when /(datetime)/ then :string
    when /^date$/ then :string
    else type_sym
    end
  end
end
