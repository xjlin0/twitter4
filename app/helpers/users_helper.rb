module UsersHelper
  def follow_button(options={})
    user = options.fetch(:user)
    extra_class = options.fetch(:extra_class)
    unfollow_label = options.fetch(:unfollow_label) {"Unfollow the user"}
    follow_label = options.fetch(:follow_label) {"Follow the user"}

    if current_user.idols.include?(user)
      return button_to(unfollow_label, user_remove_followship_path(user_id: user.id), method: :delete, class: "button btn " + extra_class)
    else
      return button_to(follow_label, user_new_followship_path(user_id: user.id), class: "button btn " + extra_class)
    end
  end
end
