require 'net/http'
require 'json'
$urlString = 'https://api.stagingeb.com/v1/contact_requests'
$testCode = ''
class TestCodeRuby
	def main
		url = URI.parse($urlString)
		http = Net::HTTP.new(url.host,url.port)
		http.use_ssl = true
		request = Net::HTTP::Get.new(url.path)
		request["accept"] = 'application/json'
		request["X-Authorization"] = getApiKey
		response = http.request(request)
		informationAndPrint(response)
	end

	def getApiKey
		apiKey = 'l7u502p8v46ba3ppgvj5y2aad50lb9'
		return apiKey
	end
		
	def informationAndPrint(data)
		if data.code == '200'
			datos = JSON.parse(data.body)
			for read in datos["content"]
				puts "ID: #{read["id"]} -- NAME: #{read["name"]}"
			end
		else 
			puts "ERROR: #{data.code}"
		end
		$testCode = data.code
	end
end

objc = TestCodeRuby.new
objc.main