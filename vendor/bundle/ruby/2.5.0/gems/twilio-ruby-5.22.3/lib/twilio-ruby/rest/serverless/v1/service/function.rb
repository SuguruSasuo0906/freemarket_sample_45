##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Serverless < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class FunctionList < ListResource
            ##
            # Initialize the FunctionList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The unique SID identifier of the Service for this
            #   Function.
            # @return [FunctionList] FunctionList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/Functions"
            end

            ##
            # Lists FunctionInstance records from the API as a list.
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
            # Streams FunctionInstance records from the API as an Enumerable.
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
            # When passed a block, yields FunctionInstance records from the API.
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
            # Retrieve a single page of FunctionInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of FunctionInstance
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
              FunctionPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of FunctionInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of FunctionInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              FunctionPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of FunctionInstance records from the API.
            # Request is executed immediately.
            # @param [String] friendly_name A human-readable description of this Function,
            #   fewer than 256 characters. Required.
            # @return [FunctionInstance] Newly created FunctionInstance
            def create(friendly_name: nil)
              data = Twilio::Values.of({'FriendlyName' => friendly_name, })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              FunctionInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Serverless.V1.FunctionList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class FunctionPage < Page
            ##
            # Initialize the FunctionPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [FunctionPage] FunctionPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of FunctionInstance
            # @param [Hash] payload Payload response from the API
            # @return [FunctionInstance] FunctionInstance
            def get_instance(payload)
              FunctionInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Serverless.V1.FunctionPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class FunctionContext < InstanceContext
            ##
            # Initialize the FunctionContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The unique SID identifier of the Service for this
            #   Function.
            # @param [String] sid The unique SID identifier of this Function.
            # @return [FunctionContext] FunctionContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid, sid: sid, }
              @uri = "/Services/#{@solution[:service_sid]}/Functions/#{@solution[:sid]}"

              # Dependents
              @function_versions = nil
            end

            ##
            # Fetch a FunctionInstance
            # @return [FunctionInstance] Fetched FunctionInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              FunctionInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid], )
            end

            ##
            # Update the FunctionInstance
            # @param [String] friendly_name A human-readable description of this Function,
            #   fewer than 256 characters. Required.
            # @return [FunctionInstance] Updated FunctionInstance
            def update(friendly_name: nil)
              data = Twilio::Values.of({'FriendlyName' => friendly_name, })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              FunctionInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid], )
            end

            ##
            # Access the function_versions
            # @return [FunctionVersionList]
            # @return [FunctionVersionContext] if sid was passed.
            def function_versions(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return FunctionVersionContext.new(@version, @solution[:service_sid], @solution[:sid], sid, )
              end

              unless @function_versions
                @function_versions = FunctionVersionList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    function_sid: @solution[:sid],
                )
              end

              @function_versions
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Serverless.V1.FunctionContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Serverless.V1.FunctionContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class FunctionInstance < InstanceResource
            ##
            # Initialize the FunctionInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The unique SID identifier of the Service for this
            #   Function.
            # @param [String] sid The unique SID identifier of this Function.
            # @return [FunctionInstance] FunctionInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'friendly_name' => payload['friendly_name'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'service_sid' => service_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [FunctionContext] FunctionContext for this FunctionInstance
            def context
              unless @instance_context
                @instance_context = FunctionContext.new(@version, @params['service_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] Function Sid.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] Account Sid.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] Service Sid.
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [String] A human-readable description of this Function.
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [Time] The date that this Function was created.
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date that this Function was updated.
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The URL of this Function.
            def url
              @properties['url']
            end

            ##
            # @return [String] Nested resource URLs.
            def links
              @properties['links']
            end

            ##
            # Fetch a FunctionInstance
            # @return [FunctionInstance] Fetched FunctionInstance
            def fetch
              context.fetch
            end

            ##
            # Update the FunctionInstance
            # @param [String] friendly_name A human-readable description of this Function,
            #   fewer than 256 characters. Required.
            # @return [FunctionInstance] Updated FunctionInstance
            def update(friendly_name: nil)
              context.update(friendly_name: friendly_name, )
            end

            ##
            # Access the function_versions
            # @return [function_versions] function_versions
            def function_versions
              context.function_versions
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Serverless.V1.FunctionInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Serverless.V1.FunctionInstance #{values}>"
            end
          end
        end
      end
    end
  end
end