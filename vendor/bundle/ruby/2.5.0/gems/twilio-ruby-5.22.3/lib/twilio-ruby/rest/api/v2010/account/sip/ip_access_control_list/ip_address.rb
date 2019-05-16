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
          class SipList < ListResource
            class IpAccessControlListContext < InstanceContext
              class IpAddressList < ListResource
                ##
                # Initialize the IpAddressList
                # @param [Version] version Version that contains the resource
                # @param [String] account_sid The unique id of the Account that is responsible for
                #   this resource.
                # @param [String] ip_access_control_list_sid The unique id of the
                #   IpAccessControlList resource that includes this resource.
                # @return [IpAddressList] IpAddressList
                def initialize(version, account_sid: nil, ip_access_control_list_sid: nil)
                  super(version)

                  # Path Solution
                  @solution = {account_sid: account_sid, ip_access_control_list_sid: ip_access_control_list_sid}
                  @uri = "/Accounts/#{@solution[:account_sid]}/SIP/IpAccessControlLists/#{@solution[:ip_access_control_list_sid]}/IpAddresses.json"
                end

                ##
                # Lists IpAddressInstance records from the API as a list.
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
                # Streams IpAddressInstance records from the API as an Enumerable.
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
                # When passed a block, yields IpAddressInstance records from the API.
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
                # Retrieve a single page of IpAddressInstance records from the API.
                # Request is executed immediately.
                # @param [String] page_token PageToken provided by the API
                # @param [Integer] page_number Page Number, this value is simply for client state
                # @param [Integer] page_size Number of records to return, defaults to 50
                # @return [Page] Page of IpAddressInstance
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
                  IpAddressPage.new(@version, response, @solution)
                end

                ##
                # Retrieve a single page of IpAddressInstance records from the API.
                # Request is executed immediately.
                # @param [String] target_url API-generated URL for the requested results page
                # @return [Page] Page of IpAddressInstance
                def get_page(target_url)
                  response = @version.domain.request(
                      'GET',
                      target_url
                  )
                  IpAddressPage.new(@version, response, @solution)
                end

                ##
                # Retrieve a single page of IpAddressInstance records from the API.
                # Request is executed immediately.
                # @param [String] friendly_name A human readable descriptive text for this
                #   resource, up to 64 characters long.
                # @param [String] ip_address An IP address in dotted decimal notation from which
                #   you want to accept traffic. Any SIP requests from this IP address will be
                #   allowed by Twilio. IPv4 only supported today.
                # @param [String] cidr_prefix_length An integer representing the length of the
                #   CIDR prefix to use with this IP address when accepting traffic. By default the
                #   entire IP address is used.
                # @return [IpAddressInstance] Newly created IpAddressInstance
                def create(friendly_name: nil, ip_address: nil, cidr_prefix_length: :unset)
                  data = Twilio::Values.of({
                      'FriendlyName' => friendly_name,
                      'IpAddress' => ip_address,
                      'CidrPrefixLength' => cidr_prefix_length,
                  })

                  payload = @version.create(
                      'POST',
                      @uri,
                      data: data
                  )

                  IpAddressInstance.new(
                      @version,
                      payload,
                      account_sid: @solution[:account_sid],
                      ip_access_control_list_sid: @solution[:ip_access_control_list_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '#<Twilio.Api.V2010.IpAddressList>'
                end
              end

              class IpAddressPage < Page
                ##
                # Initialize the IpAddressPage
                # @param [Version] version Version that contains the resource
                # @param [Response] response Response from the API
                # @param [Hash] solution Path solution for the resource
                # @return [IpAddressPage] IpAddressPage
                def initialize(version, response, solution)
                  super(version, response)

                  # Path Solution
                  @solution = solution
                end

                ##
                # Build an instance of IpAddressInstance
                # @param [Hash] payload Payload response from the API
                # @return [IpAddressInstance] IpAddressInstance
                def get_instance(payload)
                  IpAddressInstance.new(
                      @version,
                      payload,
                      account_sid: @solution[:account_sid],
                      ip_access_control_list_sid: @solution[:ip_access_control_list_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '<Twilio.Api.V2010.IpAddressPage>'
                end
              end

              class IpAddressContext < InstanceContext
                ##
                # Initialize the IpAddressContext
                # @param [Version] version Version that contains the resource
                # @param [String] account_sid The unique id of the
                #   [Account](https://www.twilio.com/docs/api/rest/account) responsible for this
                #   resource.
                # @param [String] ip_access_control_list_sid The IpAccessControlList Sid that
                #   identifies the IpAddress resources to fetch.
                # @param [String] sid A 34 character string that uniquely identifies the IpAddress
                #   resource to fetch.
                # @return [IpAddressContext] IpAddressContext
                def initialize(version, account_sid, ip_access_control_list_sid, sid)
                  super(version)

                  # Path Solution
                  @solution = {
                      account_sid: account_sid,
                      ip_access_control_list_sid: ip_access_control_list_sid,
                      sid: sid,
                  }
                  @uri = "/Accounts/#{@solution[:account_sid]}/SIP/IpAccessControlLists/#{@solution[:ip_access_control_list_sid]}/IpAddresses/#{@solution[:sid]}.json"
                end

                ##
                # Fetch a IpAddressInstance
                # @return [IpAddressInstance] Fetched IpAddressInstance
                def fetch
                  params = Twilio::Values.of({})

                  payload = @version.fetch(
                      'GET',
                      @uri,
                      params,
                  )

                  IpAddressInstance.new(
                      @version,
                      payload,
                      account_sid: @solution[:account_sid],
                      ip_access_control_list_sid: @solution[:ip_access_control_list_sid],
                      sid: @solution[:sid],
                  )
                end

                ##
                # Update the IpAddressInstance
                # @param [String] ip_address An IP address in dotted decimal notation from which
                #   you want to accept traffic. Any SIP requests from this IP address will be
                #   allowed by Twilio. IPv4 only supported today.
                # @param [String] friendly_name A human readable descriptive text for this
                #   resource, up to 64 characters long.
                # @param [String] cidr_prefix_length An integer representing the length of the
                #   CIDR prefix to use with this IP address when accepting traffic. By default the
                #   entire IP address is used.
                # @return [IpAddressInstance] Updated IpAddressInstance
                def update(ip_address: :unset, friendly_name: :unset, cidr_prefix_length: :unset)
                  data = Twilio::Values.of({
                      'IpAddress' => ip_address,
                      'FriendlyName' => friendly_name,
                      'CidrPrefixLength' => cidr_prefix_length,
                  })

                  payload = @version.update(
                      'POST',
                      @uri,
                      data: data,
                  )

                  IpAddressInstance.new(
                      @version,
                      payload,
                      account_sid: @solution[:account_sid],
                      ip_access_control_list_sid: @solution[:ip_access_control_list_sid],
                      sid: @solution[:sid],
                  )
                end

                ##
                # Deletes the IpAddressInstance
                # @return [Boolean] true if delete succeeds, true otherwise
                def delete
                  @version.delete('delete', @uri)
                end

                ##
                # Provide a user friendly representation
                def to_s
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Api.V2010.IpAddressContext #{context}>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Api.V2010.IpAddressContext #{context}>"
                end
              end

              class IpAddressInstance < InstanceResource
                ##
                # Initialize the IpAddressInstance
                # @param [Version] version Version that contains the resource
                # @param [Hash] payload payload that contains response from Twilio
                # @param [String] account_sid The unique id of the Account that is responsible for
                #   this resource.
                # @param [String] ip_access_control_list_sid The unique id of the
                #   IpAccessControlList resource that includes this resource.
                # @param [String] sid A 34 character string that uniquely identifies the IpAddress
                #   resource to fetch.
                # @return [IpAddressInstance] IpAddressInstance
                def initialize(version, payload, account_sid: nil, ip_access_control_list_sid: nil, sid: nil)
                  super(version)

                  # Marshaled Properties
                  @properties = {
                      'sid' => payload['sid'],
                      'account_sid' => payload['account_sid'],
                      'friendly_name' => payload['friendly_name'],
                      'ip_address' => payload['ip_address'],
                      'cidr_prefix_length' => payload['cidr_prefix_length'].to_i,
                      'ip_access_control_list_sid' => payload['ip_access_control_list_sid'],
                      'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                      'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                      'uri' => payload['uri'],
                  }

                  # Context
                  @instance_context = nil
                  @params = {
                      'account_sid' => account_sid,
                      'ip_access_control_list_sid' => ip_access_control_list_sid,
                      'sid' => sid || @properties['sid'],
                  }
                end

                ##
                # Generate an instance context for the instance, the context is capable of
                # performing various actions.  All instance actions are proxied to the context
                # @return [IpAddressContext] IpAddressContext for this IpAddressInstance
                def context
                  unless @instance_context
                    @instance_context = IpAddressContext.new(
                        @version,
                        @params['account_sid'],
                        @params['ip_access_control_list_sid'],
                        @params['sid'],
                    )
                  end
                  @instance_context
                end

                ##
                # @return [String] A 34 character string that uniquely identifies this resource.
                def sid
                  @properties['sid']
                end

                ##
                # @return [String] The unique id of the Account that is responsible for this resource.
                def account_sid
                  @properties['account_sid']
                end

                ##
                # @return [String] A human readable descriptive text for this resource, up to 64 characters long.
                def friendly_name
                  @properties['friendly_name']
                end

                ##
                # @return [String] An IP address in dotted decimal notation from which you want to accept traffic. Any SIP requests from this IP address will be allowed by Twilio. IPv4 only supported today.
                def ip_address
                  @properties['ip_address']
                end

                ##
                # @return [String] An integer representing the length of the CIDR prefix to use with this IP address when accepting traffic. By default the entire IP address is used.
                def cidr_prefix_length
                  @properties['cidr_prefix_length']
                end

                ##
                # @return [String] The unique id of the IpAccessControlList resource that includes this resource.
                def ip_access_control_list_sid
                  @properties['ip_access_control_list_sid']
                end

                ##
                # @return [Time] The date that this resource was created, given as GMT in RFC 2822 format.
                def date_created
                  @properties['date_created']
                end

                ##
                # @return [Time] The date that this resource was last updated, given as GMT in RFC 2822 format.
                def date_updated
                  @properties['date_updated']
                end

                ##
                # @return [String] The URI for this resource, relative to https://api.twilio.com
                def uri
                  @properties['uri']
                end

                ##
                # Fetch a IpAddressInstance
                # @return [IpAddressInstance] Fetched IpAddressInstance
                def fetch
                  context.fetch
                end

                ##
                # Update the IpAddressInstance
                # @param [String] ip_address An IP address in dotted decimal notation from which
                #   you want to accept traffic. Any SIP requests from this IP address will be
                #   allowed by Twilio. IPv4 only supported today.
                # @param [String] friendly_name A human readable descriptive text for this
                #   resource, up to 64 characters long.
                # @param [String] cidr_prefix_length An integer representing the length of the
                #   CIDR prefix to use with this IP address when accepting traffic. By default the
                #   entire IP address is used.
                # @return [IpAddressInstance] Updated IpAddressInstance
                def update(ip_address: :unset, friendly_name: :unset, cidr_prefix_length: :unset)
                  context.update(
                      ip_address: ip_address,
                      friendly_name: friendly_name,
                      cidr_prefix_length: cidr_prefix_length,
                  )
                end

                ##
                # Deletes the IpAddressInstance
                # @return [Boolean] true if delete succeeds, true otherwise
                def delete
                  context.delete
                end

                ##
                # Provide a user friendly representation
                def to_s
                  values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Api.V2010.IpAddressInstance #{values}>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Api.V2010.IpAddressInstance #{values}>"
                end
              end
            end
          end
        end
      end
    end
  end
end