module ApplicationHelper
  ###################
  #  for role and action judge
  ###################
  def controller?(*controller)
    controller.include?(params[:controller])
  end
  def action?(*action)
    action.include?(params[:action])
  end
  ### for hide/show some part of page
  def dev?
    Rails.env == 'development'
  end  
  def prod?
    Rails.env == 'production'
  end
  def admin?
    current_user.is_admin
  end
  def mobile?
    case request.user_agent #request.env['HTTP_USER_AGENT']
      when /iPad/i
        true#request.variant = :phone
      when /iPhone/i
        true#request.variant = :phone
      when /Android/i && /mobile/i
        true#request.variant = :phone
      when /Android/i
        true#request.variant = :phone
      when /Windows Phone/i
        true#request.variant = :phone
      else
        false#request.variant = :desktop
    end
  end
  ##########################
end
