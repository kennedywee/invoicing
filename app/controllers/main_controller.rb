class MainController < ApplicationController
  layout 'application'

  before_action :redirect_to_member_dashboard

  def redirect_to_member_dashboard
    return unless user_signed_in?

    redirect_to portal_root_url
  end
end
