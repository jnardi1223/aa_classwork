# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworksShare.destroy_all

j = User.create(username: "Jim")
d = User.create(username: "Darrick")
da = User.create(username: "David")

a1 = Artwork.create(title: "Mona Lisa", artist_id: j.id, img_url: "https://cdn.britannica.com/s:690x388,c:crop/24/189624-050-F3C5BAA9/Mona-Lisa-oil-wood-panel-Leonardo-da.jpg")
a2 = Artwork.create(title: "Starry Night", artist_id: d.id, img_url: "https://media.sanctuarymentalhealth.org/wp-content/uploads/2021/03/04151535/The-Starry-Night.jpg")
a3 = Artwork.create(title: "Birth of Venus", artist_id: da.id, img_url: "https://images.uffizi.it/production/attachments/1503909239806647-605174-2-.jpg?ixlib=rails-2.1.3&w=1200&h=800&fit=clip&crop=center&fm=gjpg&auto=compress")

ArtworksShare.create(artwork_id: a1.id, viewer_id: d.id)
ArtworksShare.create(artwork_id: a2.id, viewer_id: da.id)
ArtworksShare.create(artwork_id: a3.id, viewer_id: j.id)

Comment.create(user_id: j.id, artwork_id: a1.id, body: "this is a great piece" )
Comment.create(user_id: d.id, artwork_id: a1.id, body: "this is a great piece" )
Comment.create(user_id: da.id, artwork_id: a1.id, body: "this is a great piece")