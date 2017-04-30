module UserHelper
  def user_logged_in
    @user ||= User.find_by(id: session[:user_id])
  end

  def count_votes(voteable)
    (voteable.votes.where(v_type: "up").count) - (voteable.votes.where(v_type: "down").count)
  end
end

helpers UserHelper
