# == Schema Information
#
# Table name: task_doers
#
#  id              :integer          not null, primary key
#  about           :text
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class TaskDoer < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
