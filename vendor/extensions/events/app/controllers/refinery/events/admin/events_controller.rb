module Refinery
  module Events
    module Admin
      class EventsController < ::Refinery::AdminController

        crudify :'refinery/events/event'

        private

        # Only allow a trusted parameter "white list" through.
        def event_params
          params.require(:event).permit(:title, :group, :date, :photo_id, :description, :short_description, :location)
        end
      end
    end
  end
end
