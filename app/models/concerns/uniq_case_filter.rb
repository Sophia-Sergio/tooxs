module UniqCaseFilter
  module DataCase
    extend ActiveSupport::Concern
    include UniqCaseFilter

    def find_case(month, year = Date.today.year)
      find_by(month: month, year: year)
    end
  end
  module Staff
    extend ActiveSupport::Concern
    include UniqCaseFilter

    def staff_by_day(month, year = Date.today.year)
      where(month: month, year: year)
        .order(:day).pluck(:day, :staff_number).to_h
    end
  end
end
