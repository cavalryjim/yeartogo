class User < ActiveRecord::Base
	has_many :goals
	
	attr_accessible :email, :password, :password_confirmation, :avatar, :name, :username, :location
	attr_accessor :password
	
	before_save :encrypt_password
	before_create :setup_activation
	
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_uniqueness_of :email
	validates_presence_of :username
	validates_uniqueness_of :username
	
	def self.authenticate(email, password)
	  person = find_by_email(email)
	  if person && BCrypt::Password.new(person.password_hash) == password
	    person
	  else
	    nil
	  end
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
