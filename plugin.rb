module Plugins
    module NewMemberWaitingPeriod
        class Plugin < Plugins::Base
            setup! :new_member_waiting_period do |plugin|
                plugin.enabled = true

                # This ability adds the server-side restriction
                plugin.use_class 'models/ability/new_member_waiting_period'
                plugin.extend_class Ability::Base do
                    prepend Ability::NewMemberWaitingPeriod
                end

                # This asset adds the client-side restriction
                plugin.use_asset 'assets/new_member_waiting_period.coffee'

                # This updates the wording of the client-side error message
                plugin.use_translations("config/locales", :new_member_waiting_period)
            end
        end
    end
end
