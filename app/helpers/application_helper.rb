module ApplicationHelper
  def like_button(idea)
    return nil unless logged_in?
    like_flag = current_user.like?(idea)

    buttons = content_tag(:button, class: "#{(like_flag) ? '' : 'hidden-button'}") do
        link_to "unlike", unlike_path(idea_id: idea.id), class: "like"
      end
    buttons << content_tag(:button, class: "#{(like_flag) ? 'hidden-button' : ''}") do
        link_to "like", like_path(idea_id: idea.id), class: "like"
      end
    content_tag :div do
      buttons
    end
  end

  def likes_list(idea)
    users = idea.likes.map(&:user)
    if logged_in?
      users.reject!{|u| u == current_user}
      like_now = current_user.like?(idea)
    end
    users_icon(users, like_now, "idea-#{idea.id}")
  end

  def users_icon(users, current_user_show, klass = "")
    content_tag :div, :class => 'user-icon' do
      html = ""
      users.each do |user|
        html << image_tag(user.image_url, width: 30, height: 30, alt: user.nickname, title: user.nickname)
      end
      html << image_tag(current_user.image_url, width: 30, height: 30, alt: current_user.nickname, title: current_user.nickname, class: "#{klass} current-user-icon #{(current_user_show) ? '' : 'hidden-icon'}")
      html.html_safe
    end
  end
end
