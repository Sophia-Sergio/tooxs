class DataCase < ApplicationRecord
  has_many :summary_cases
  has_one :staffing_case
  has_one :return_case
  belongs_to :store_department

end
