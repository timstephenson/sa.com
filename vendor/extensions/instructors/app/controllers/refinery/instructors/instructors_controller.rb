module Refinery
  module Instructors
    class InstructorsController < ::ApplicationController

      before_action :find_all_instructors
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @instructor in the line below:
        present(@page)
      end

      def show
        @instructor = Instructor.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @instructor in the line below:
        present(@page)
      end

    protected

      def find_all_instructors
        @instructors = Instructor.where(active: true).order('position ASC')
        @past_instructors = Instructor.where(active: false).order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/instructors").first
      end

    end
  end
end
