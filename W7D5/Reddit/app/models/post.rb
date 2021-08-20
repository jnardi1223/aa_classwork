# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author_id  :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord

    belongs_to :author, 
        foreign_key: :author_id,
        class_name: :User 
    
    belongs_to :sub, 
        foreign_key: :sub_id,
        class_name: :Sub 

    

end
