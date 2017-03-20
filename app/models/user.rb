# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  validates :email,
    presence: true,
    length: { maximum: 255 },
    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  before_save { email.downcase! }
end
