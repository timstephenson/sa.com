Refinery::PagesController.class_eval do
  before_action :fetch_footer_data, :only => [:show, :home]

  protected

  def fetch_footer_data
    @events = Refinery::Events::Event.where(['date >= ?', DateTime.now.beginning_of_day]).order('date ASC')
    @instructors = Refinery::Instructors::Instructor.where(active: true).order('position ASC')
    @posts = Refinery::Blog::Post.recent(10)
  end
end