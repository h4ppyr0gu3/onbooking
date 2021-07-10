class Ticket < ApplicationRecord
	has_many_attached :documents
	belongs_to :member
end
