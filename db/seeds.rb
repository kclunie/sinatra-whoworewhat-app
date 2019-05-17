#create users 

monica = User.create(name: "Monica", email: "monica@friends.com", password: "monica")
rachel = User.create(name: "Rachel", email: "rachel@friends.com", password: "rachel")

#outfit entries - differnt ways to set up associations - build has to be saved

OutfitEntry.create(content: "Purple sweater and jeans", user_id: monica.id)

monica.outfit_entries.create(content: "Black cocktail dress")

rachels_entry = rachel.outfit_entries.build(content: "Pink skirt and white buttondown")
rachels_entry.save
