##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class WorkflowContext < InstanceContext
            class WorkflowCumulativeStatisticsList < ListResource
              ##
              # Initialize the WorkflowCumulativeStatisticsList
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The workspace_sid
              # @param [String] workflow_sid The workflow_sid
              # @return [WorkflowCumulativeStatisticsList] WorkflowCumulativeStatisticsList
              def initialize(version, workspace_sid: nil, workflow_sid: nil)
                super(version)

                # Path Solution
                @solution = {workspace_sid: workspace_sid, workflow_sid: workflow_sid}
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Taskrouter.V1.WorkflowCumulativeStatisticsList>'
              end
            end

            class WorkflowCumulativeStatisticsPage < Page
              ##
              # Initialize the WorkflowCumulativeStatisticsPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [WorkflowCumulativeStatisticsPage] WorkflowCumulativeStatisticsPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of WorkflowCumulativeStatisticsInstance
              # @param [Hash] payload Payload response from the API
              # @return [WorkflowCumulativeStatisticsInstance] WorkflowCumulativeStatisticsInstance
              def get_instance(payload)
                WorkflowCumulativeStatisticsInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    workflow_sid: @solution[:workflow_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Taskrouter.V1.WorkflowCumulativeStatisticsPage>'
              end
            end

            class WorkflowCumulativeStatisticsContext < InstanceContext
              ##
              # Initialize the WorkflowCumulativeStatisticsContext
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The workspace_sid
              # @param [String] workflow_sid The workflow_sid
              # @return [WorkflowCumulativeStatisticsContext] WorkflowCumulativeStatisticsContext
              def initialize(version, workspace_sid, workflow_sid)
                super(version)

                # Path Solution
                @solution = {workspace_sid: workspace_sid, workflow_sid: workflow_sid, }
                @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workflows/#{@solution[:workflow_sid]}/CumulativeStatistics"
              end

              ##
              # Fetch a WorkflowCumulativeStatisticsInstance
              # @param [Time] end_date Filter cumulative statistics by an end date. This is
              #   helpful for defining a range of statistics to capture. Input is a GMT ISO 8601
              #   Timestamp
              # @param [String] minutes Filter cumulative statistics by up to 'x' minutes in the
              #   past. This is helpful for statistics for the last 15 minutes, 240 minutes (4
              #   hours), and 480 minutes (8 hours) to see trends. Defaults to 15 minutes.
              # @param [Time] start_date Filter cumulative statistics by a start date. This is
              #   helpful for defining a range of statistics to capture. Input is a GMT ISO 8601
              #   Timestamp
              # @param [String] task_channel Filter real-time and cumulative statistics by
              #   TaskChannel. Takes in a Unique Name ("voice", "sms", "default", etc.) or a
              #   TaskChannelSid.
              # @param [String] split_by_wait_time A comma separated values for viewing splits
              #   of tasks canceled and accepted above the given threshold in seconds. Ex: "5,30"
              #   would show splits of tasks that were canceled or accepted before or after 5
              #   seconds and respectively, 30 seconds. This is great for showing short abandoned
              #   tasks or tasks that failed to meet your SLA.
              # @return [WorkflowCumulativeStatisticsInstance] Fetched WorkflowCumulativeStatisticsInstance
              def fetch(end_date: :unset, minutes: :unset, start_date: :unset, task_channel: :unset, split_by_wait_time: :unset)
                params = Twilio::Values.of({
                    'EndDate' => Twilio.serialize_iso8601_datetime(end_date),
                    'Minutes' => minutes,
                    'StartDate' => Twilio.serialize_iso8601_datetime(start_date),
                    'TaskChannel' => task_channel,
                    'SplitByWaitTime' => split_by_wait_time,
                })

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                WorkflowCumulativeStatisticsInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    workflow_sid: @solution[:workflow_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Taskrouter.V1.WorkflowCumulativeStatisticsContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Taskrouter.V1.WorkflowCumulativeStatisticsContext #{context}>"
              end
            end

            class WorkflowCumulativeStatisticsInstance < InstanceResource
              ##
              # Initialize the WorkflowCumulativeStatisticsInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] workspace_sid The workspace_sid
              # @param [String] workflow_sid The workflow_sid
              # @return [WorkflowCumulativeStatisticsInstance] WorkflowCumulativeStatisticsInstance
              def initialize(version, payload, workspace_sid: nil, workflow_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'avg_task_acceptance_time' => payload['avg_task_acceptance_time'].to_i,
                    'start_time' => Twilio.deserialize_iso8601_datetime(payload['start_time']),
                    'end_time' => Twilio.deserialize_iso8601_datetime(payload['end_time']),
                    'reservations_created' => payload['reservations_created'].to_i,
                    'reservations_accepted' => payload['reservations_accepted'].to_i,
                    'reservations_rejected' => payload['reservations_rejected'].to_i,
                    'reservations_timed_out' => payload['reservations_timed_out'].to_i,
                    'reservations_canceled' => payload['reservations_canceled'].to_i,
                    'reservations_rescinded' => payload['reservations_rescinded'].to_i,
                    'split_by_wait_time' => payload['split_by_wait_time'],
                    'wait_duration_until_accepted' => payload['wait_duration_until_accepted'],
                    'wait_duration_until_canceled' => payload['wait_duration_until_canceled'],
                    'tasks_canceled' => payload['tasks_canceled'].to_i,
                    'tasks_completed' => payload['tasks_completed'].to_i,
                    'tasks_entered' => payload['tasks_entered'].to_i,
                    'tasks_deleted' => payload['tasks_deleted'].to_i,
                    'tasks_moved' => payload['tasks_moved'].to_i,
                    'tasks_timed_out_in_workflow' => payload['tasks_timed_out_in_workflow'].to_i,
                    'workflow_sid' => payload['workflow_sid'],
                    'workspace_sid' => payload['workspace_sid'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {'workspace_sid' => workspace_sid, 'workflow_sid' => workflow_sid, }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [WorkflowCumulativeStatisticsContext] WorkflowCumulativeStatisticsContext for this WorkflowCumulativeStatisticsInstance
              def context
                unless @instance_context
                  @instance_context = WorkflowCumulativeStatisticsContext.new(
                      @version,
                      @params['workspace_sid'],
                      @params['workflow_sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The account_sid
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The average time from Task creation to acceptance
              def avg_task_acceptance_time
                @properties['avg_task_acceptance_time']
              end

              ##
              # @return [Time] The start_time
              def start_time
                @properties['start_time']
              end

              ##
              # @return [Time] The end_time
              def end_time
                @properties['end_time']
              end

              ##
              # @return [String] The total number of Reservations that were created for Workers
              def reservations_created
                @properties['reservations_created']
              end

              ##
              # @return [String] The total number of Reservations accepted by Workers
              def reservations_accepted
                @properties['reservations_accepted']
              end

              ##
              # @return [String] The total number of Reservations that were rejected
              def reservations_rejected
                @properties['reservations_rejected']
              end

              ##
              # @return [String] The total number of Reservations that were timed out
              def reservations_timed_out
                @properties['reservations_timed_out']
              end

              ##
              # @return [String] The total number of Reservations that were canceled
              def reservations_canceled
                @properties['reservations_canceled']
              end

              ##
              # @return [String] The total number of Reservations that were rescinded
              def reservations_rescinded
                @properties['reservations_rescinded']
              end

              ##
              # @return [Hash] The splits of the tasks canceled and accepted based on the provided SplitByWaitTime parameter.
              def split_by_wait_time
                @properties['split_by_wait_time']
              end

              ##
              # @return [Hash] The wait duration stats for tasks that were accepted.
              def wait_duration_until_accepted
                @properties['wait_duration_until_accepted']
              end

              ##
              # @return [Hash] The wait duration stats for tasks that were canceled.
              def wait_duration_until_canceled
                @properties['wait_duration_until_canceled']
              end

              ##
              # @return [String] The total number of Tasks that were canceled
              def tasks_canceled
                @properties['tasks_canceled']
              end

              ##
              # @return [String] The total number of Tasks that were completed
              def tasks_completed
                @properties['tasks_completed']
              end

              ##
              # @return [String] The total number of Tasks that entered this Workflow
              def tasks_entered
                @properties['tasks_entered']
              end

              ##
              # @return [String] The total number of Tasks that were deleted
              def tasks_deleted
                @properties['tasks_deleted']
              end

              ##
              # @return [String] The total number of Tasks that were moved from one queue to another
              def tasks_moved
                @properties['tasks_moved']
              end

              ##
              # @return [String] The total number of Tasks that were timed out of their Workflows
              def tasks_timed_out_in_workflow
                @properties['tasks_timed_out_in_workflow']
              end

              ##
              # @return [String] The workflow_sid
              def workflow_sid
                @properties['workflow_sid']
              end

              ##
              # @return [String] The workspace_sid
              def workspace_sid
                @properties['workspace_sid']
              end

              ##
              # @return [String] The url
              def url
                @properties['url']
              end

              ##
              # Fetch a WorkflowCumulativeStatisticsInstance
              # @param [Time] end_date Filter cumulative statistics by an end date. This is
              #   helpful for defining a range of statistics to capture. Input is a GMT ISO 8601
              #   Timestamp
              # @param [String] minutes Filter cumulative statistics by up to 'x' minutes in the
              #   past. This is helpful for statistics for the last 15 minutes, 240 minutes (4
              #   hours), and 480 minutes (8 hours) to see trends. Defaults to 15 minutes.
              # @param [Time] start_date Filter cumulative statistics by a start date. This is
              #   helpful for defining a range of statistics to capture. Input is a GMT ISO 8601
              #   Timestamp
              # @param [String] task_channel Filter real-time and cumulative statistics by
              #   TaskChannel. Takes in a Unique Name ("voice", "sms", "default", etc.) or a
              #   TaskChannelSid.
              # @param [String] split_by_wait_time A comma separated values for viewing splits
              #   of tasks canceled and accepted above the given threshold in seconds. Ex: "5,30"
              #   would show splits of tasks that were canceled or accepted before or after 5
              #   seconds and respectively, 30 seconds. This is great for showing short abandoned
              #   tasks or tasks that failed to meet your SLA.
              # @return [WorkflowCumulativeStatisticsInstance] Fetched WorkflowCumulativeStatisticsInstance
              def fetch(end_date: :unset, minutes: :unset, start_date: :unset, task_channel: :unset, split_by_wait_time: :unset)
                context.fetch(
                    end_date: end_date,
                    minutes: minutes,
                    start_date: start_date,
                    task_channel: task_channel,
                    split_by_wait_time: split_by_wait_time,
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.WorkflowCumulativeStatisticsInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.WorkflowCumulativeStatisticsInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end