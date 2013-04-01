module UsersHelper
  def full_name(user)
    "#{user.last_name} #{user.first_name}"
  end

  def full_name_with_link(user)
    link_to "#{user.last_name} #{user.first_name}", {}
  end
end
