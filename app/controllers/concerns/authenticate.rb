module Authenticate
  extend ActiveSupport::Concern

  protected

  def log_in(app_session)
    cookies.encrypted.permanent[:app_session] = {value: app_session.to_h}
  end
end
