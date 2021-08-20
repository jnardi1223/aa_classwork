# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sub < ApplicationRecord

    has_many :post 
        foreign_key: :sub_id,
        class_name: Post

    belongs_to :moderator,
        foreign_key: :user_id,
        class_name: :User 

end
