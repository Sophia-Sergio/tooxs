class SummaryCase < ApplicationRecord
  belongs_to :data_case
  scope :output, -> { find_by(type_io: 'out') }
  scope :input, -> { find_by(type_io: 'in') }


end
