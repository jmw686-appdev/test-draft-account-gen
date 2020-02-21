# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  completed   :boolean
#  description :text
#  duration    :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ApplicationRecord
end
