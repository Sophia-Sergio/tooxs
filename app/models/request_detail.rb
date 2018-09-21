class RequestDetail < ApplicationRecord
	belongs_to :request
	belongs_to :department
end
