require "twilio-ruby"
class Message < ActiveRecord::Base

	def send_text
		twilio_sid = ENV["twilio_sid"]
		twilio_token = ENV["twilio_token"]
		twilio_phone_number = "+18182769377"
		twilio_url = "http://twimlets.com/callme?PhoneNumber=6266443347&Message=HI%20HOW%20ARE%20YOU%3F%20&FailUrl=%22http%3A%2F%2Ftwimlets.com%2Fvoicemail%3FEmail%3Dworkemaillex%40gmail.com%26Message%3DPlease%2BLeave%2BA%2BMessage%22&"
		# rememeber this: the scope of a variable within a method is limited to that 
		# method unless you definie it globally. So you couldn't access the 
		# the twilio token or id because it was defined outside of this method
		# however the class aka message could use it 
		@client = Twilio::REST::Client.new("AC01b37849cc3e96e4fb12fe5f073ba1a6", "27452efd374fa7a86af0547fd861d464")
		@message = @client.account.messages.create({
			:from => twilio_phone_number,
			:to =>   self.number,
				# right here we're simply calling the phone number method for message 
			:body => self.content})


		 
	end



	
	 
	validates :content, :name, :number, presence: true 
end



