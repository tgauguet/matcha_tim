module LikesHelper

  def is_liked?
    Liked.liked?(@user.id, current_user.id) != 0
  end

  def like_exists?(id)
    Liked.liked?(id, current_user.id) != 0
  end

  def heart_img
    is_liked? ? "heart3.png" : "heart2.png"
  end

  def liked_me?(id)
    Liked.liked?(current_user.id, id) != 0
  end

  def like_btn_val
    is_liked? ? "Dé-liker" : "Liker"
  end

  def its_a_match?(id)
    liked_me?(id) && like_exists?(id)
  end

  def match_notifications(id)
    @user = User.find_by("id", id)
    if !Block.blocked?(current_user.id, @user.id)
      Notification.new("match", id, "Vous avez un match avec #{current_user.login}")
      Notification.new("match", current_user.id, "Vous avez un match avec #{@user.login}")
    end
  end

  def heart_animation(id)
    "bg_heart" if liked_me?(id) unless its_a_match?(id)
  end

end
