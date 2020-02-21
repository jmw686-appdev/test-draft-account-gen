# == Schema Information
#
# Table name: producers
#
#  id              :integer          not null, primary key
#  about           :text
#  dob             :date
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Producer < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
