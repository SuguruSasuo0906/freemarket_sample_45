##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class MessageList < ListResource
            ##
            # Initialize the MessageList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The SID of the
            #   [Account](https://www.twilio.com/docs/api/rest/account) that sent the message
            #   that created the resource.
            # @return [MessageList] MessageList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid}
              @uri = "/Accounts/#{@solution[:account_sid]}/Messages.json"
            end

            ##
            # Retrieve a single page of MessageInstance records from the API.
            # Request is executed immediately.
            # @param [String] to The destination phone number in
            #   [E.164](https://www.twilio.com/docs/glossary/what-e164) format for SMS/MMS or
            #   [Channel user
            #   address](https://www.twilio.com/docs/sms/channels#channel-addresses) for other
            #   3rd-party channels.
            # @param [String] status_callback The URL we should call using the
            #   `status_callback_method` to send status information to your application. If
            #   specified, we POST these message status changes to the URL: `queued`, `failed`,
            #   `sent`, `delivered`, or `undelivered`. Twilio will POST its [standard request
            #   parameters](https://www.twilio.com/docs/sms/twiml#request-parameters) as well as
            #   some additional parameters including `MessageSid`, `MessageStatus`, and
            #   `ErrorCode`. If you include this parameter with the `messaging_service_sid`, we
            #   use this URL instead of the Status Callback URL of the [Messaging
            #   Service](https://www.twilio.com/docs/sms/services/api). URLs must contain a
            #   valid hostname and underscores are not allowed.
            # @param [String] application_sid The SID of the application that should receive
            #   message status. We POST a `message_sid` parameter and a `message_status`
            #   parameter with a value of `sent` or `failed` to the
            #   [application](https://www.twilio.com/docs/usage/api/applications)'s
            #   `message_status_callback`. If a `status_callback` parameter is also passed, it
            #   will be ignored and the application's `message_status_callback` parameter will
            #   be used.
            # @param [String] max_price The maximum total price in US dollars that you will
            #   pay for the message to be delivered. Can be a decimal value that has up to 4
            #   decimal places. All messages are queued for delivery and the message cost is
            #   checked before the message is sent. If the cost exceeds `max_price`, the message
            #   will fail and a status of `Failed` is sent to the status callback. If `MaxPrice`
            #   is not set, the message cost is not checked.
            # @param [Boolean] provide_feedback Whether to confirm delivery of the message.
            #   Set this value to `true` if you are sending messages that have a trackable user
            #   action and you intend to confirm delivery of the message using the [Message
            #   Feedback API](https://www.twilio.com/docs/sms/api/message-feedback). This
            #   parameter is `false` by default.
            # @param [String] validity_period How long in seconds the message can remain in
            #   our outgoing message queue. After this period elapses, the message fails and we
            #   call your status callback. Can be between 1 and the default value of 14,400
            #   seconds. After a message has been accepted by a carrier, however, we cannot
            #   guarantee that the message will not be queued after this period. We recommend
            #   that this value be at least 5 seconds.
            # @param [Boolean] force_delivery Reserved
            # @param [Boolean] smart_encoded Whether to detect Unicode characters that have a
            #   similar GSM-7 character and replace them. Can be: `true` or `false`.
            # @param [String] interactive_data A JSON string that represents an interactive
            #   message. An interactive message is a category of messages that includes a list
            #   picker, a time picker, and an Apple Pay request.
            # @param [Boolean] force_opt_in Whether to forcefully whitelist a from:to pair.
            #   Can be: `true` or `false`.
            # @param [String] from A Twilio phone number in
            #   [E.164](https://www.twilio.com/docs/glossary/what-e164) format, an [alphanumeric
            #   sender
            #   ID](https://www.twilio.com/docs/sms/send-messages#use-an-alphanumeric-sender-id), or a [Channel Endpoint address](https://www.twilio.com/docs/sms/channels#channel-addresses) that is enabled for the type of message you want to send. Phone numbers or [short codes](https://www.twilio.com/docs/sms/api/short-codes) purchased from Twilio also work here. You cannot, for example, spoof messages from a private cell phone number. If you are using `messaging_service_sid`, this parameter must be empty.
            # @param [String] messaging_service_sid The SID of the [Messaging
            #   Service](https://www.twilio.com/docs/sms/services#send-a-message-with-copilot)
            #   you want to associate with the Message. Set this parameter to use the [Messaging
            #   Service Settings and Copilot
            #   Features](https://www.twilio.com/console/sms/services) you have configured and
            #   leave the `from` parameter empty. When only this parameter is set, Twilio will
            #   use your enabled Copilot Features to select the `from` phone number for
            #   delivery.
            # @param [String] body The text of the message you want to send. Can be up to
            #   1,600 characters in length.
            # @param [String] media_url The URL of the media to send with the message. The
            #   media can be of type `gif`, `png`, and `jpeg` and will be formatted correctly on
            #   the recipient's device. [Other
            #   types](https://www.twilio.com/docs/sms/accepted-mime-types) of media are also
            #   accepted. The media size limit is 5MB. To send more than one image in the
            #   message body, provide multiple `media_url` parameters in the POST request. You
            #   can include up to 10 `media_url` parameters per message. You can send images in
            #   an SMS message in only the US and Canada.
            # @return [MessageInstance] Newly created MessageInstance
            def create(to: nil, status_callback: :unset, application_sid: :unset, max_price: :unset, provide_feedback: :unset, validity_period: :unset, force_delivery: :unset, smart_encoded: :unset, interactive_data: :unset, force_opt_in: :unset, from: :unset, messaging_service_sid: :unset, body: :unset, media_url: :unset)
              data = Twilio::Values.of({
                  'To' => to,
                  'From' => from,
                  'MessagingServiceSid' => messaging_service_sid,
                  'Body' => body,
                  'MediaUrl' => Twilio.serialize_list(media_url) { |e| e },
                  'StatusCallback' => status_callback,
                  'ApplicationSid' => application_sid,
                  'MaxPrice' => max_price,
                  'ProvideFeedback' => provide_feedback,
                  'ValidityPeriod' => validity_period,
                  'ForceDelivery' => force_delivery,
                  'SmartEncoded' => smart_encoded,
                  'InteractiveData' => interactive_data,
                  'ForceOptIn' => force_opt_in,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              MessageInstance.new(@version, payload, account_sid: @solution[:account_sid], )
            end

            ##
            # Lists MessageInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] to Read messages sent to only this phone number.
            # @param [String] from Read messages sent from only this phone number or
            #   alphanumeric sender ID.
            # @param [Time] date_sent_before Filter by date sent
            # @param [Time] date_sent Filter by date sent
            # @param [Time] date_sent_after Filter by date sent
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(to: :unset, from: :unset, date_sent_before: :unset, date_sent: :unset, date_sent_after: :unset, limit: nil, page_size: nil)
              self.stream(
                  to: to,
                  from: from,
                  date_sent_before: date_sent_before,
                  date_sent: date_sent,
                  date_sent_after: date_sent_after,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams MessageInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] to Read messages sent to only this phone number.
            # @param [String] from Read messages sent from only this phone number or
            #   alphanumeric sender ID.
            # @param [Time] date_sent_before Filter by date sent
            # @param [Time] date_sent Filter by date sent
            # @param [Time] date_sent_after Filter by date sent
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(to: :unset, from: :unset, date_sent_before: :unset, date_sent: :unset, date_sent_after: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  to: to,
                  from: from,
                  date_sent_before: date_sent_before,
                  date_sent: date_sent,
                  date_sent_after: date_sent_after,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields MessageInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of MessageInstance records from the API.
            # Request is executed immediately.
            # @param [String] to Read messages sent to only this phone number.
            # @param [String] from Read messages sent from only this phone number or
            #   alphanumeric sender ID.
            # @param [Time] date_sent_before Filter by date sent
            # @param [Time] date_sent Filter by date sent
            # @param [Time] date_sent_after Filter by date sent
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of MessageInstance
            def page(to: :unset, from: :unset, date_sent_before: :unset, date_sent: :unset, date_sent_after: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'To' => to,
                  'From' => from,
                  'DateSent<' => Twilio.serialize_iso8601_datetime(date_sent_before),
                  'DateSent' => Twilio.serialize_iso8601_datetime(date_sent),
                  'DateSent>' => Twilio.serialize_iso8601_datetime(date_sent_after),
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              MessagePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of MessageInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of MessageInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              MessagePage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.MessageList>'
            end
          end

          class MessagePage < Page
            ##
            # Initialize the MessagePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [MessagePage] MessagePage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of MessageInstance
            # @param [Hash] payload Payload response from the API
            # @return [MessageInstance] MessageInstance
            def get_instance(payload)
              MessageInstance.new(@version, payload, account_sid: @solution[:account_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.MessagePage>'
            end
          end

          class MessageContext < InstanceContext
            ##
            # Initialize the MessageContext
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The SID of the
            #   [Account](https://www.twilio.com/docs/api/rest/account) that created the Message
            #   resource to fetch.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   Message resource to fetch.
            # @return [MessageContext] MessageContext
            def initialize(version, account_sid, sid)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid, sid: sid, }
              @uri = "/Accounts/#{@solution[:account_sid]}/Messages/#{@solution[:sid]}.json"

              # Dependents
              @media = nil
              @feedback = nil
            end

            ##
            # Deletes the MessageInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Fetch a MessageInstance
            # @return [MessageInstance] Fetched MessageInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              MessageInstance.new(@version, payload, account_sid: @solution[:account_sid], sid: @solution[:sid], )
            end

            ##
            # Update the MessageInstance
            # @param [String] body The text of the message you want to send. Can be up to
            #   1,600 characters long.
            # @return [MessageInstance] Updated MessageInstance
            def update(body: nil)
              data = Twilio::Values.of({'Body' => body, })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              MessageInstance.new(@version, payload, account_sid: @solution[:account_sid], sid: @solution[:sid], )
            end

            ##
            # Access the media
            # @return [MediaList]
            # @return [MediaContext] if sid was passed.
            def media(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return MediaContext.new(@version, @solution[:account_sid], @solution[:sid], sid, )
              end

              unless @media
                @media = MediaList.new(@version, account_sid: @solution[:account_sid], message_sid: @solution[:sid], )
              end

              @media
            end

            ##
            # Access the feedback
            # @return [FeedbackList]
            # @return [FeedbackContext]
            def feedback
              unless @feedback
                @feedback = FeedbackList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    message_sid: @solution[:sid],
                )
              end

              @feedback
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.MessageContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.MessageContext #{context}>"
            end
          end

          class MessageInstance < InstanceResource
            ##
            # Initialize the MessageInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid The SID of the
            #   [Account](https://www.twilio.com/docs/api/rest/account) that sent the message
            #   that created the resource.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   Message resource to fetch.
            # @return [MessageInstance] MessageInstance
            def initialize(version, payload, account_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'api_version' => payload['api_version'],
                  'body' => payload['body'],
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                  'date_sent' => Twilio.deserialize_rfc2822(payload['date_sent']),
                  'direction' => payload['direction'],
                  'error_code' => payload['error_code'].to_i,
                  'error_message' => payload['error_message'],
                  'from' => payload['from'],
                  'messaging_service_sid' => payload['messaging_service_sid'],
                  'num_media' => payload['num_media'],
                  'num_segments' => payload['num_segments'],
                  'price' => payload['price'].to_f,
                  'price_unit' => payload['price_unit'],
                  'sid' => payload['sid'],
                  'status' => payload['status'],
                  'subresource_uris' => payload['subresource_uris'],
                  'to' => payload['to'],
                  'uri' => payload['uri'],
              }

              # Context
              @instance_context = nil
              @params = {'account_sid' => account_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [MessageContext] MessageContext for this MessageInstance
            def context
              unless @instance_context
                @instance_context = MessageContext.new(@version, @params['account_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The API version used to process the message
            def api_version
              @properties['api_version']
            end

            ##
            # @return [String] The message text
            def body
              @properties['body']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT that the resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT that the resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT when the message was sent
            def date_sent
              @properties['date_sent']
            end

            ##
            # @return [message.Direction] The direction of the message
            def direction
              @properties['direction']
            end

            ##
            # @return [String] The error code associated with the message
            def error_code
              @properties['error_code']
            end

            ##
            # @return [String] The description of the error_code
            def error_message
              @properties['error_message']
            end

            ##
            # @return [String] The phone number that initiated the message
            def from
              @properties['from']
            end

            ##
            # @return [String] The SID of the Messaging Service used with the message.
            def messaging_service_sid
              @properties['messaging_service_sid']
            end

            ##
            # @return [String] The number of media files associated with the message
            def num_media
              @properties['num_media']
            end

            ##
            # @return [String] The number of messages used to deliver the message body
            def num_segments
              @properties['num_segments']
            end

            ##
            # @return [String] The amount billed for the message
            def price
              @properties['price']
            end

            ##
            # @return [String] The currency in which price is measured
            def price_unit
              @properties['price_unit']
            end

            ##
            # @return [String] The unique string that identifies the resource
            def sid
              @properties['sid']
            end

            ##
            # @return [message.Status] The status of the message
            def status
              @properties['status']
            end

            ##
            # @return [String] A list of related resources identified by their relative URIs
            def subresource_uris
              @properties['subresource_uris']
            end

            ##
            # @return [String] The phone number that received the message
            def to
              @properties['to']
            end

            ##
            # @return [String] The URI of the resource, relative to `https://api.twilio.com`
            def uri
              @properties['uri']
            end

            ##
            # Deletes the MessageInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Fetch a MessageInstance
            # @return [MessageInstance] Fetched MessageInstance
            def fetch
              context.fetch
            end

            ##
            # Update the MessageInstance
            # @param [String] body The text of the message you want to send. Can be up to
            #   1,600 characters long.
            # @return [MessageInstance] Updated MessageInstance
            def update(body: nil)
              context.update(body: body, )
            end

            ##
            # Access the media
            # @return [media] media
            def media
              context.media
            end

            ##
            # Access the feedback
            # @return [feedback] feedback
            def feedback
              context.feedback
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.MessageInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.MessageInstance #{values}>"
            end
          end
        end
      end
    end
  end
end