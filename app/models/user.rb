class User < ApplicationRecord
  has_many :listings
  has_many :requests
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'from_user_id'
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'to_user_id'

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4 }
  # before_save :sanitize_email

  def self.authenticate_with_credentials(emailAddress, password)
    # emailAddress.downcase!
    # emailAddress.strip!
    user = User.find_by_email(emailAddress)
    user ? user.authenticate(password)? user : nil : nil
  end

  def sanitize_email
    self.email.downcase!
    self.email.strip!
  end

end
