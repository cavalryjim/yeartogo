class Tag < ActiveRecord::Base
	has_many :taggings, :dependent => :destroy
	has_many :goals, :through => :taggings
	
	validates_presence_of :name
	
	def self.with_names(names)
		names.map do |name|
			Tag.find_or_create_by_name(name)
		end
	end
end
