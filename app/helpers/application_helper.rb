# -*- encoding : utf-8 -*-
module ApplicationHelper

  def logged_in?
    !!current_user
  end

end
