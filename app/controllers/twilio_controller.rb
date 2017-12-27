class TwilioController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # skip_before_filter :verify_authenticity_token

  def reply
    # message_body = params["Body"]
    begin
      from_number = params["From"]
      initialize_twilio
      sms = @client.messages.create(
        from: Rails.application.secrets.twilio_number,
        to: from_number,
        body: "Hello there, We received your message. Thank You!"
      )
    rescue Twilio::REST::TwilioError => e
      puts e.message
    end
  end

  private

  def initialize_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
