Refinery::PagesController.class_eval do
  before_action :fetch_upcoming_events, :only => [:show]

  def fetch_upcoming_events
    @events = Refinery::Events::Event.where(['date >= ?', DateTime.now.beginning_of_day]).order('date ASC')
  end
  protected :fetch_upcoming_events
end