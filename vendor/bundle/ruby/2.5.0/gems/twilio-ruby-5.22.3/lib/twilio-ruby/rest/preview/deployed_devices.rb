##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Preview
      class DeployedDevices < Version
        ##
        # Initialize the DeployedDevices version of Preview
        def initialize(domain)
          super
          @version = 'DeployedDevices'
          @fleets = nil
        end

        ##
        # @param [String] sid Provides a 34 character string that uniquely identifies the
        #   requested Fleet resource.
        # @return [Twilio::REST::Preview::DeployedDevices::FleetContext] if sid was passed.
        # @return [Twilio::REST::Preview::DeployedDevices::FleetList]
        def fleets(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @fleets ||= FleetList.new self
          else
            FleetContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Preview::DeployedDevices>'
        end
      end
    end
  end
end