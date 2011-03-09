class User < ActiveRecord::Base
	has_many :goals
	
	attr_accessible :email, :password, :password_confirmation, :avatar, :name, :username, :location, :about
	attr_accessor :password
	
	before_save :encrypt_password
	before_create :setup_activation
	
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_uniqueness_of :email
	validates_presence_of :username
	validates_uniqueness_of :username
	
	has_many :friendships
	has_many :friends, :through => :friendships
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user
	
	mount_uploader :avatar, ImageUploader
	
	def self.authenticate(username, password)
	  user = find_by_username(username)
	  if user && BCrypt::Password.new(user.password_hash) == password
	    user
	  else
	    nil
	  end
	end
	
	def self.display_name
		name || username
	end

	def encrypt_password
	  if password.present?
	    self.password_hash = BCrypt::Password.create(password)
	  end
	end	
	
	def setup_activation
		self.activated = false
		self.activate_token = SecureRandom.hex(20)
	end
end
