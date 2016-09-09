module Refinery
  module Instructors
    module Admin
      class InstructorsController < ::Refinery::AdminController

        crudify :'refinery/instructors/instructor',
                :title_attribute => 'full_name'

        private

        # Only allow a trusted parameter "white list" through.
        def instructor_params
          params.require(:instructor).permit(:full_name, :photo_id, :full_bio, :short_bio, :active)
        end
      end
    end
  end
end
