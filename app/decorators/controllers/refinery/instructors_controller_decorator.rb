Refinery::Instructors::InstructorsController.class_eval do

  before_filter :fetch_upcoming_events, only: [:index, :show]

  protected

  def fetch_upcoming_events
    @events = Refinery::Events::Event.where(['date >= ?', DateTime.now.beginning_of_day]).order('date ASC')
    @posts = Refinery::Blog::Post.recent(10)
  end
end 