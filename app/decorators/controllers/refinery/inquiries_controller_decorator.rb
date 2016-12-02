Refinery::Inquiries::InquiriesController.class_eval do

  before_filter :fetch_footer_data, only: [:new, :thank_you]

  protected

  def fetch_footer_data
    @events = Refinery::Events::Event.where(['date >= ?', DateTime.now.beginning_of_day]).order('date ASC')
    @instructors =  Refinery::Instructors::Instructor.where(active: true).order('position ASC')
    @posts = Refinery::Blog::Post.recent(10)
  end
end 