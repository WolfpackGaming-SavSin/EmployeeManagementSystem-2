module UsersHelper
  def user_role(user)
    case User.roles[user.role]
    when User.roles[:user]
      "User"
    when User.roles[:supervisor]
      "Supervisor"
    when User.roles[:manager]
      "Manager"
    when User.roles[:admin]
      "Admin"
    else
      "You are no one!"
    end
  end
end
