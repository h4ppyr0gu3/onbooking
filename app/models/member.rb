class Member < ApplicationRecord
	belongs_to :group
	has_many :tickets
end
