class Job < ActiveRecord::Base
	before_save :query_link
	belongs_to :user
	require 'net/http'

	def query_link
		uri = URI(self.url)
		res = Net::HTTP.get_response(uri)
		return res.code
	end

end
