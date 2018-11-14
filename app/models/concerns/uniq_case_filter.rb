module UniqCaseFilter

  def all_keys?(keys, data)
    keys.all? { |key| data.key?(key) }
  end

  def find_case_required_keys(keys, params)
    all_keys?(keys, params)
  end

  module DataCase
    extend ActiveSupport::Concern
    include UniqCaseFilter

    FIELDS = %i[store department month year].freeze

    def find_case(params)
      find_by!(params) if find_case_required_keys(FIELDS, params)
    end
  end
  module StaffingReal
    extend ActiveSupport::Concern
    include UniqCaseFilter

    FIELDS = %i[store department month year].freeze

    def staff_by_day(params)
      return unless find_case_required_keys(FIELDS, params)

      where(params).order(:day).pluck(:count)
    end
  end
end
