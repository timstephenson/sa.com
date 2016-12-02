Refinery::Events::EventsController.class_eval do

  before_filter :fetch_footer_data, only: [:index, :show]

  protected

  def fetch_footer_data
    @instructors =  Refinery::Instructors::Instructor.where(active: true).order('position ASC')
    @posts = Refinery::Blog::Post.recent(10)
  end
end 