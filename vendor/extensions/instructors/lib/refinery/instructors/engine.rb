module Refinery
  module Instructors
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Instructors

      engine_name :refinery_instructors

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "instructors"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.instructors_admin_instructors_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Instructors)
      end
    end
  end
end
