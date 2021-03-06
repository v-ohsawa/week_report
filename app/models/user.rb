class User < ActiveRecord::Base
	has_many :week_reports, dependent: :destroy
	has_many :projects, through: :week_reports
	before_create :create_remember_token
	has_secure_password
	validates :password, length: { minimum: 3 }
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end
	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end
	def user_id_and_name
		self.worker_id.to_s + ' : ' + self.name
	end
	private
	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end
end
