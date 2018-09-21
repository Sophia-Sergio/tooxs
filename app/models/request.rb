class Request < ApplicationRecord
	belongs_to :user
	has_many :request_detail
end
