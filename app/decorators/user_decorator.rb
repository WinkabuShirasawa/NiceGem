#-*- coding: utf-8 -*-
module UserDecorator
  def full_name
    "#{last_name} #{first_name}"
  end

  def full_name_with_link
    link_to "#{last_name} #{first_name}", {}
  end
end
