require 'csv'

class Survey < ActiveRecord::Base
  include Surveyor::Models::SurveyMethods

  def title
    super
  end
  
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |survey|
        csv << survey.attributes.values_at(*column_names)
      end
    end
  end
end
