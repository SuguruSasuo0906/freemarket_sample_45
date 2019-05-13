##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'FlexFlow' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.flex_api.v1.flex_flow.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://flex-api.twilio.com/v1/FlexFlows',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://flex-api.twilio.com/v1/FlexFlows?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://flex-api.twilio.com/v1/FlexFlows?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "flex_flows"
          },
          "flex_flows": [
              {
                  "sid": "FOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2016-08-01T22:10:40Z",
                  "date_updated": "2016-08-01T22:10:40Z",
                  "friendly_name": "friendly_name",
                  "chat_service_sid": "SIaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "channel_type": "sms",
                  "contact_identity": "12345",
                  "enabled": true,
                  "integration_type": "studio",
                  "integration": {
                      "flow_sid": "FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                  },
                  "long_lived": true,
                  "url": "https://flex-api.twilio.com/v1/FlexFlows/FOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.flex_api.v1.flex_flow.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://flex-api.twilio.com/v1/FlexFlows?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://flex-api.twilio.com/v1/FlexFlows?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "flex_flows"
          },
          "flex_flows": []
      }
      ]
    ))

    actual = @client.flex_api.v1.flex_flow.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.flex_api.v1.flex_flow('FOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://flex-api.twilio.com/v1/FlexFlows/FOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "FOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2016-08-01T22:10:40Z",
          "date_updated": "2016-08-01T22:10:40Z",
          "friendly_name": "friendly_name",
          "chat_service_sid": "SIaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_type": "sms",
          "contact_identity": "12345",
          "enabled": true,
          "integration_type": "studio",
          "integration": {
              "flow_sid": "FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          },
          "long_lived": true,
          "url": "https://flex-api.twilio.com/v1/FlexFlows/FOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.flex_api.v1.flex_flow('FOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.flex_api.v1.flex_flow.create(friendly_name: 'friendly_name', chat_service_sid: 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', channel_type: 'web')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {
        'FriendlyName' => 'friendly_name',
        'ChatServiceSid' => 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
        'ChannelType' => 'web',
    }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://flex-api.twilio.com/v1/FlexFlows',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "FOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2016-08-01T22:10:40Z",
          "date_updated": "2016-08-01T22:10:40Z",
          "friendly_name": "friendly_name",
          "chat_service_sid": "SIaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_type": "sms",
          "contact_identity": "12345",
          "enabled": true,
          "integration_type": "studio",
          "integration": {
              "flow_sid": "FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          },
          "long_lived": true,
          "url": "https://flex-api.twilio.com/v1/FlexFlows/FOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.flex_api.v1.flex_flow.create(friendly_name: 'friendly_name', chat_service_sid: 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', channel_type: 'web')

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.flex_api.v1.flex_flow('FOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://flex-api.twilio.com/v1/FlexFlows/FOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "FOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2016-08-01T22:10:40Z",
          "date_updated": "2016-08-01T22:10:40Z",
          "friendly_name": "friendly_name",
          "chat_service_sid": "SIaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_type": "sms",
          "contact_identity": "12345",
          "enabled": true,
          "integration_type": "studio",
          "integration": {
              "flow_sid": "FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          },
          "long_lived": true,
          "url": "https://flex-api.twilio.com/v1/FlexFlows/FOaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.flex_api.v1.flex_flow('FOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.flex_api.v1.flex_flow('FOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://flex-api.twilio.com/v1/FlexFlows/FOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.flex_api.v1.flex_flow('FOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end