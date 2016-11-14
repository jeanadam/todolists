class Profile < ActiveRecord::Base
	belongs_to :user

	validates :gender, inclusion: { in: %w(male female) }
	validate :custom_valid_profile,
			 :custom_valid_first_name

	def custom_valid_profile
		if (first_name.nil? && last_name.nil?)
			errors.add(:first_name, "First and last name can't be both empty.")
		end 
	end

	def custom_valid_first_name
		if (first_name == 'Sue' && gender == 'male')
			errors.add(:first_name, "Male can't have 'Sue' as a name.")
		end 
	end

	def self.get_all_profiles(min, max)
		return Profile.all.where('birth_year between ? and ?', min, max).order(birth_year: :asc)
	end
end
