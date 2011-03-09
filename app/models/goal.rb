class Goal < ActiveRecord::Base
	belongs_to :category
	belongs_to :tag
	has_many :comments, :dependent => :destroy
	has_many :milestones, :dependent => :destroy
	belongs_to :user
	has_many :tags, :through => :taggings
	has_many :taggings, :dependent => :destroy
	
	validates_presence_of :privacy
	validates_presence_of :name
	validates_uniqueness_of :name, :scope => :user_id 
	validates_presence_of :timeline
	
	attr_writer :tag_names
	attr_accessor :day, :month, :year
	before_save :set_completion
	
	def private?
		(privacy == 1)
	end
	
	def public?
		(privacy == 2)
	end
	
	def friends?
		(privacy == 3)
	end
	
	def set_completion
		completion = 0
		completion += 10 if self.name.present?
		completion += 10 if self.category.present?
		completion += 20 if self.timeline.present?
		completion += [10 * (0.1 * self.tags.count), 60].min if self.tags.count > 0
		completion += [50 * (0.1 * self.milestones.count), 60].min if self.milestones.count > 0
		self.completion = [100, completion].min
	end
	
	def tag_names=(names)
    self.tags = Tag.with_names(names.gsub(',','').split(/\s+/))
  end

  def tag_names
    tags.map(&:name).join(', ')
  end
end