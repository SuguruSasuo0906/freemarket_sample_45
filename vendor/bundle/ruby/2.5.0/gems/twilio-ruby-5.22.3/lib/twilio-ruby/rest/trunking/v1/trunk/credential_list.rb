##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Trunking < Domain
      class V1 < Version
        class TrunkContext < InstanceContext
          class CredentialListList < ListResource
            ##
            # Initialize the CredentialListList
            # @param [Version] version Version that contains the resource
            # @param [String] trunk_sid The SID of the Trunk the credential list in associated
            #   with.
            # @return [CredentialListList] CredentialListList
            def initialize(version, trunk_sid: nil)
              super(version)

              # Path Solution
              @solution = {trunk_sid: trunk_sid}
              @uri = "/Trunks/#{@solution[:trunk_sid]}/CredentialLists"
            end

            ##
            # Retrieve a single page of CredentialListInstance records from the API.
            # Request is executed immediately.
            # @param [String] credential_list_sid The SID of the [Credential
            #   List](https://www.twilio.com/docs/api/rest/credential-list) that you want to
            #   associate with the trunk. Once associated, we will authenticate access to the
            #   trunk against this list.
            # @return [CredentialListInstance] Newly created CredentialListInstance
            def create(credential_list_sid: nil)
              data = Twilio::Values.of({'CredentialListSid' => credential_list_sid, })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              CredentialListInstance.new(@version, payload, trunk_sid: @solution[:trunk_sid], )
            end

            ##
            # Lists CredentialListInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams CredentialListInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields CredentialListInstance records from the API.
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
            # Retrieve a single page of CredentialListInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of CredentialListInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              CredentialListPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of CredentialListInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of CredentialListInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              CredentialListPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Trunking.V1.CredentialListList>'
            end
          end

          class CredentialListPage < Page
            ##
            # Initialize the CredentialListPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [CredentialListPage] CredentialListPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of CredentialListInstance
            # @param [Hash] payload Payload response from the API
            # @return [CredentialListInstance] CredentialListInstance
            def get_instance(payload)
              CredentialListInstance.new(@version, payload, trunk_sid: @solution[:trunk_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Trunking.V1.CredentialListPage>'
            end
          end

          class CredentialListContext < InstanceContext
            ##
            # Initialize the CredentialListContext
            # @param [Version] version Version that contains the resource
            # @param [String] trunk_sid The SID of the Trunk from which to fetch the
            #   credential list.
            # @param [String] sid The unique string that we created to identify the
            #   CredentialList resource to fetch.
            # @return [CredentialListContext] CredentialListContext
            def initialize(version, trunk_sid, sid)
              super(version)

              # Path Solution
              @solution = {trunk_sid: trunk_sid, sid: sid, }
              @uri = "/Trunks/#{@solution[:trunk_sid]}/CredentialLists/#{@solution[:sid]}"
            end

            ##
            # Fetch a CredentialListInstance
            # @return [CredentialListInstance] Fetched CredentialListInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              CredentialListInstance.new(
                  @version,
                  payload,
                  trunk_sid: @solution[:trunk_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the CredentialListInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Trunking.V1.CredentialListContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Trunking.V1.CredentialListContext #{context}>"
            end
          end

          class CredentialListInstance < InstanceResource
            ##
            # Initialize the CredentialListInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] trunk_sid The SID of the Trunk the credential list in associated
            #   with.
            # @param [String] sid The unique string that we created to identify the
            #   CredentialList resource to fetch.
            # @return [CredentialListInstance] CredentialListInstance
            def initialize(version, payload, trunk_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'sid' => payload['sid'],
                  'trunk_sid' => payload['trunk_sid'],
                  'friendly_name' => payload['friendly_name'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'trunk_sid' => trunk_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [CredentialListContext] CredentialListContext for this CredentialListInstance
            def context
              unless @instance_context
                @instance_context = CredentialListContext.new(@version, @params['trunk_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The unique string that identifies the resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The SID of the Trunk the credential list in associated with
            def trunk_sid
              @properties['trunk_sid']
            end

            ##
            # @return [String] The string that you assigned to describe the resource
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT when the resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT when the resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The absolute URL of the resource
            def url
              @properties['url']
            end

            ##
            # Fetch a CredentialListInstance
            # @return [CredentialListInstance] Fetched CredentialListInstance
            def fetch
              context.fetch
            end

            ##
            # Deletes the CredentialListInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Trunking.V1.CredentialListInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Trunking.V1.CredentialListInstance #{values}>"
            end
          end
        end
      end
    end
  end
end