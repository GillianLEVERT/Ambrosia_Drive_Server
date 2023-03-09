require 'faker'
# Création de 5 magasins
5.times do
    Store.create!(
      name: Faker::Company.name,
      image_url: Faker::LoremPixel.image(size: "300x300")
    )
  end

  5.times do
    store.admins.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
    )
  end

  
  # Création de 10 rayons pour chaque magasin
  Store.all.each do |store|
    10.times do
      store.store_shelves.create!(
        name: Faker::Commerce.department,
        description: Faker::Lorem.sentence
      )
    end
  end
  
  # Création de 15 paniers
  15.times do
    Cart.create!(
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price,
      description: Faker::Lorem.sentence
      quantity: Faker::Number.between(from: 1, to: 100),
      volume: Faker::Number.between(from: 1, to: 10),
      volume_type: ['litres', 'kilogrammes', 'pièces'].sample
    )
  end
  
  # Création de 20 utilisateurs
  20.times do
    User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
    )
  end
  
  # Création de 40 produits
  40.times do
    Product.create!(
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price,
      description: Faker::Lorem.sentence,
      image_url: Faker::LoremPixel.image(size: "300x300"),
      quantity: Faker::Number.between(from: 1, to: 100),
      volume: Faker::Number.between(from: 1, to: 10),
      volume_type: ['litres', 'kilogrammes', 'pièces'].sample
    )
  end