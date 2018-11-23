class DataCase < ApplicationRecord
  extend UniqCaseFilter::DataCase
  has_many :summary_cases
  has_one :staffing_case
  has_one :return_case
  belongs_to :store
  belongs_to :department

  def summary_case_output
    summary_cases.find_by(type_io: 'out')
  end

  def summary_case_input
    summary_cases.find_by(type_io: 'in')
  end
end
