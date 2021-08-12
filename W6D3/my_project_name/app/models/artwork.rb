# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  img_url   :string           not null
#  artist_id :integer          not null
#
class Artwork < ApplicationRecord
    validates :artist_id, uniqueness: {scope: :title, message: 'Artwork already exist'}
    validates :artist_id, presence: true, uniqueness: true  

    belongs_to :artist, 
        foreign_key: :artist_id,
        class_name: :User 

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworksShare

    belongs_to :shared_viewers, 
        through: :artwork_shares,
        source: :viewer  
        
end 
