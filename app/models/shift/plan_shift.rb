class PlanShift < ApplicationRecord
  belongs_to :work_shift
  scope :find_case, ->(opts) { find_by(opts.slice(:week, :day)) if %i[week day].all? { |s| opts.key? s } }

  def hours_should_work
    from = check_in&.hour || 0
    to = check_out&.hour || 0
    (from..to-1).map do |hour|
      "#{hour} - #{hour + 1}"
    end
  end
end
