##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Webhook' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .webhooks.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://messaging.twilio.com/v1/Sessions/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 5,
              "first_page_url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks?PageSize=5&Page=0",
              "previous_page_url": null,
              "url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks?PageSize=5&Page=0",
              "next_page_url": null,
              "key": "webhooks"
          },
          "webhooks": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "session_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "WHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "target": "webhook",
                  "configuration": {
                      "url": "dummy",
                      "method": "get",
                      "filters": [
                          "onMessageSent",
                          "onSessionDestroyed"
                      ],
                      "retry_count": 2,
                      "buffer_messages": false
                  },
                  "date_created": "2016-03-24T21:05:50Z",
                  "date_updated": "2016-03-24T21:05:50Z",
                  "url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks/WHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              },
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "session_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "WHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "target": "trigger",
                  "configuration": {
                      "url": "dummy",
                      "method": "post",
                      "filters": [
                          "keyword1",
                          "keyword2"
                      ],
                      "retry_count": 3,
                      "buffer_messages": true,
                      "buffer_window": 3000
                  },
                  "date_created": "2016-03-24T21:05:50Z",
                  "date_updated": "2016-03-24T21:05:50Z",
                  "url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks/WHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              },
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "session_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "WHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "target": "studio",
                  "configuration": {
                      "flow_sid": "FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      "buffer_messages": false,
                      "buffer_window": 4000
                  },
                  "date_created": "2016-03-24T21:05:50Z",
                  "date_updated": "2016-03-24T21:05:50Z",
                  "url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks/WHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .webhooks.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 5,
              "first_page_url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks?PageSize=5&Page=0",
              "url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks?PageSize=5&Page=0",
              "previous_page_url": null,
              "next_page_url": null,
              "key": "webhooks"
          },
          "webhooks": []
      }
      ]
    ))

    actual = @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .webhooks.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .webhooks('WHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://messaging.twilio.com/v1/Sessions/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks/WHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "session_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "WHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "target": "studio",
          "configuration": {
              "flow_sid": "FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
              "buffer_messages": false
          },
          "date_created": "2016-03-24T21:05:50Z",
          "date_updated": "2016-03-24T21:05:50Z",
          "url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks/WHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .webhooks('WHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .webhooks.create(target: 'webhook')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Target' => 'webhook', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://messaging.twilio.com/v1/Sessions/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "session_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "WHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "target": "webhook",
          "configuration": {
              "url": "dummy",
              "method": "get",
              "filters": [
                  "onMessageSent",
                  "onSessionDestroyed"
              ],
              "retry_count": 2,
              "buffer_messages": true,
              "buffer_window": 3000
          },
          "date_created": "2016-03-24T21:05:50Z",
          "date_updated": "2016-03-24T21:05:50Z",
          "url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks/WHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .webhooks.create(target: 'webhook')

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .webhooks('WHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://messaging.twilio.com/v1/Sessions/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks/WHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "session_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "WHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "target": "trigger",
          "configuration": {
              "url": "dummy",
              "method": "post",
              "filters": [
                  "keyword1",
                  "keyword2"
              ],
              "retry_count": 3,
              "buffer_messages": true,
              "buffer_window": 5000
          },
          "date_created": "2016-03-24T21:05:50Z",
          "date_updated": "2016-03-24T21:05:51Z",
          "url": "https://messaging.twilio.com/v1/Sessions/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Webhooks/WHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .webhooks('WHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                          .webhooks('WHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://messaging.twilio.com/v1/Sessions/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Webhooks/WHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.messaging.v1.sessions('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                 .webhooks('WHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end