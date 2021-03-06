class Patient < ApplicationRecord
	has_many :encounters, dependent: :destroy
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :mrn, presence: true
end
