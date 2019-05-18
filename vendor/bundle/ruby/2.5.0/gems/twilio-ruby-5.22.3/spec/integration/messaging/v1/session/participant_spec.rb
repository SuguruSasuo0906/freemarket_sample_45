##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Participant' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .participants.create()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://messaging.twilio.com/v1/Sessions/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants',
    ))).to eq(true)
  end

  it "receives create_identity responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "messaging_service_sid": "MGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "session_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "Twilio",
          "attributes": "{ \\"foo\\": \\"bar\\" }",
          "date_created": "2015-12-16T22:18:37Z",
          "date_updated": "2015-12-16T22:18:38Z",
          "type": "chat",
          "twilio_address": "+372666555",
          "user_address": "+372666556",
          "url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .participants.create()

    expect(actual).to_not eq(nil)
  end

  it "receives create_address responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "messaging_service_sid": "MGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "session_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": null,
          "attributes": "{}",
          "date_created": "2016-03-24T21:05:50Z",
          "date_updated": "2016-03-24T21:05:50Z",
          "type": "chat",
          "twilio_address": "+372666555",
          "user_address": "+372666556",
          "url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .participants.create()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .participants('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://messaging.twilio.com/v1/Sessions/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "messaging_service_sid": "MGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "session_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "Twilio",
          "attributes": "{ \\"foo\\": \\"bar\\" }",
          "date_created": "2015-12-16T22:18:37Z",
          "date_updated": "2015-12-16T22:18:38Z",
          "type": "chat",
          "twilio_address": "+372666555",
          "user_address": "+372666556",
          "url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .participants('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .participants('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://messaging.twilio.com/v1/Sessions/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "messaging_service_sid": "MGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "session_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "Twilio",
          "attributes": "{}",
          "date_created": "2016-03-24T21:05:50Z",
          "date_updated": "2016-03-24T21:05:50Z",
          "type": "chat",
          "twilio_address": "+372666555",
          "user_address": "+372666556",
          "url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .participants('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .participants.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://messaging.twilio.com/v1/Sessions/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants',
    ))).to eq(true)
  end

  it "receives read responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "participants"
          },
          "participants": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "messaging_service_sid": "MGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "session_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "identity": "Twilio",
                  "attributes": "{}",
                  "date_created": "2016-03-24T21:05:50Z",
                  "date_updated": "2016-03-24T21:05:50Z",
                  "type": "chat",
                  "twilio_address": "+372666555",
                  "user_address": "+372666556",
                  "url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .participants.list()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .participants('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://messaging.twilio.com/v1/Sessions/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .participants('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end