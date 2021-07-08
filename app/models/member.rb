class Member < ApplicationRecord
	belongs_to :group
	has_many :tickets

	def self.seed_uuid
		if self.uuid = nil
			self.uuid = SecureRandom.uuid
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
		else
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
			puts "fuuuuuuck"
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
			puts ""
		end
	end
end
