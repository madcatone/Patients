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
  def fullname(first, middle, last)
    "#{last}, #{first} #{middle}"
  end
  def age?(birth_at)
    now = Time.now.utc.to_date
    now.year - birth_at.year - (birth_at.to_date.change(:year => now.year) > now ? 1 : 0)
  end
  def mr_no(id)
    mr_no = ''
    case id.to_s.length
    when 1
      mr_no = '00000'+ id.to_s
    when 2
      mr_no = '0000'+ id.to_s
    when 3
      mr_no = '000'+ id.to_s
    when 4
      mr_no = '00'+ id.to_s
    when 5
      mr_no = '0'+ id.to_s
    when 6
      mr_no =  id.to_s
    end
    'MR' + mr_no rescue ''
  end
  def status(status)
    case status
    when '1'
      I18n.t('patient.initial')
    when '2'
      I18n.t('patient.referred')
    when '3'
      I18n.t('patient.treatment')
    when '4'
      I18n.t('patient.closed')
    else
      I18n.t('patient.none')
    end
  end
  def gender(gender)
    case gender
    when 'not_available'
      I18n.t('patient.none')
    when 'male'
      I18n.t('form.male')
    when 'female'
      I18n.t('form.female')
    else
      I18n.t('patient.none')
    end
  end
end
