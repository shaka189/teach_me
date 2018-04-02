module ApplicationHelper
  def paginate objects, options = {}
    options.reverse_merge!( theme: 'twitter-bootstrap-3' )
    super( objects, options )
  end

  def current_conversation user_id
    Conversation.current_conversation(user_id)[0].id
  end

  def resource_name
    :user
  end

  def resource_class
    User
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
