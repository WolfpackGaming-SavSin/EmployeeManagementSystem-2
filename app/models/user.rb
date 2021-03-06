class User < ApplicationRecord
  enum role: [:user, :supervisor, :manager, :admin]

  after_initialize :set_default_role, :if => :new_record?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  def active_for_authentication?
    super && status?
  end

  def inactive_message
    status? ? super : :account_inactive
  end

  def set_default_role
    self.role ||= :user
  end

  def display_name
    "#{self.first_name} #{self.last_name}"
  end
end
