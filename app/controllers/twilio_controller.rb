class TwilioController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # skip_before_filter :verify_authenticity_token

  #Method that responds to incoming twilio messages for the 'twilio/reply' route
  def reply
    # message_body = params["Body"]
    contained_media_count = params["NumMedia"].to_i
    message_body = params["Body"]
    if contained_media_count > 0
      event = Event.find_by(twilio_number: params["To"])
      medium = event.create_medium(params)
      if message_body != ""
        message = medium.create_message(params)
      end
      send_reply(params)
    else
      send_reply(params)
    end
  end

  def event
    begin
      temp_number = find_number
      event_number = create_number(temp_number)

      event = Event.create(title: params["title"], user_id: params["userId"], twilio_number: event_number.phone_number)
      render json: event
    rescue Twilio::REST::TwilioError => e
      puts e.message
    end
  end

  private

  # Method opens a new Twilio client instance to respond to incoming messages
  def initialize_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  # Method expects a hash as input with the 'To' and 'From' keys as part of that hash, i.e. the base twilio post params will do
  def send_reply(params)
    begin
      initialize_twilio
      sms = create_message(params["To"], params["From"])
    rescue Twilio::REST::TwilioError => e
      puts e.message
    end
  end

  # Method creates a twilio response message to user that sent the message using twilio post hash
  def create_message(from, to)
    @client.messages.create(
      from: from,
      to: to,
      body: "Hello there, We received your message. Thank You!"
    )
  end

  def find_number
    initialize_twilio
    @client.api.available_phone_numbers('US').local
    .list(
      in_region: 'NY',
      exclude_all_address_required: 'true',
      exclude_local_address_required: 'true',
      voice_enabled: 'true',
      sms_enabled: 'true',
      mms_enabled: 'true'
    )[0].phone_number
  end

  def create_number(number)
    initialize_twilio
    @client.incoming_phone_numbers
    .create(
      phone_number: number,
      voice_url: 'https://demo.twilio.com/welcome/voice/',
      voice_method: 'POST',
      sms_url: 'http://be0df8e5.ngrok.io/twilio/reply',
      sms_method: 'POST'
    )
  end

end
