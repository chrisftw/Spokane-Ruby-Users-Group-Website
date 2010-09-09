module AuthlogicHelper
  def current_user_session
    @current_user_session ||= UserSession.find
  end

  def current_user
    puts "~~~~~~~~~~~~~"
    puts @current_user.inspect
    return ( @current_user ||= current_user_session.user ) if current_user_session
    return nil
  end
end
