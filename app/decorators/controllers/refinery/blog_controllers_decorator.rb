Refinery::Blog::BlogController.class_eval do

  before_filter :fetch_footer_data, only: [:index, :show, :tagged, :archive]

  protected

  def fetch_footer_data
    @events = Refinery::Events::Event.where(['date >= ?', DateTime.now.beginning_of_day]).order('date ASC')
    @instructors =  Refinery::Instructors::Instructor.where(active: true).order('position ASC')
  end
end 