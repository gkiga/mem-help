# == Schema Information
#
# Table name: videos
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Video < ApplicationRecord
    has_one_attached :clip
end
