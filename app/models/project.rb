class Project < ActiveRecord::Base
	has_many :week_reports
	has_many :users, through: :week_reports

	def project_id_and_name
		self.code.to_s + ' : ' + self.name
	end
end
