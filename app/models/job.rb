class Job < ActiveRecord::Base
	before_save :query_link
	belongs_to :user
	require 'net/http'

	def query_link
		uri = URI(self.url)
		res = Net::HTTP.get_response(uri)
		return res.code
	end

	def res_display(code)
		if code == "200"
			return "Active Job"
		elsif code == "404"
			return "Inactive Job"
		else
			return "Unknown Status"
		end
	end

	def applied?
		self.apply ? "Yes" : "No"
	end

end
