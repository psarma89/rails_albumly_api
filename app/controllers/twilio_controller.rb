class TwilioController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # skip_before_filter :verify_authenticity_token

  def reply
    # message_body = params["Body"]
    contained_media_count = params["NumMedia"].to_i
    if contained_media_count > 0
      event = Event.find_by(twilio_number: params["To"])
      
      send_reply(params["To"], params["From"])
    else
    end
  end

  private

  def initialize_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_reply(from, to)
    begin
      initialize_twilio
      sms = create_message(from, to)
    rescue Twilio::REST::TwilioError => e
      puts e.message
    end
  end

  def create_message(from, to)
    @client.messages.create(
      from: from,
      to: to,
      body: "Hello there, We received your message. Thank You!"
    )
  end
end
