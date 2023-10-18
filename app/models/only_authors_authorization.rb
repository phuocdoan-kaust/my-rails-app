class OnlyAuthorsAuthorization < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
    user && user.admin?
  end

end
