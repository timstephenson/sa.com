module ApplicationHelper
  def menu_header
    presenter = Refinery::Pages::BootstrapMenuPresenter.new(refinery_menu_pages, self)
    presenter.first_css = nil
    presenter.last_css = nil

    presenter
  end
end
