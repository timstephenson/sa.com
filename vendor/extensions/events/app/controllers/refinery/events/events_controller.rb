module Refinery
  module Events
    class EventsController < ::ApplicationController

      before_action :find_all_events
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @event in the line below:
        present(@page)
      end

      def show
        @event = Event.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @event in the line below:
        present(@page)
      end

    protected

      def find_all_events
        @events = Event.where(['date >= ?', DateTime.now.beginning_of_day]).order('date ASC')
        @past_events = Event.where(['date < ?', DateTime.now.beginning_of_day]).order('date DESC').limit(12)
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/events").first
      end

    end
  end
end
