require 'faker'

User.destroy_all
Store.destroy_all
StoreShelf.destroy_all
Product.destroy_all


  5.times do
    User.create!(
      email: Faker::Internet.email,
    )
  end

  User.create!(
    email: 'driveambrosia@gmail.com',
    admin: true,
  )


  Store.create!(
    name: Faker::Company.name,
    img_url: Faker::LoremFlickr.image(size: "300x300"),
    admin: User.find_by(email:'driveambrosia@gmail.com'),
  )




  # Création de 10 rayons pour chaque magasin
  10.times do
    StoreShelf.create!(
      name: Faker::Commerce.department,
      store: Store.all.sample
    )
  end


# Création de 40 produits
  40.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    quantity: Faker::Number.between(from: 1, to: 100),
    volume: Faker::Number.between(from: 1, to: 10),
    volume_type: rand(4),
    price: Faker::Commerce.price,
    img_url: Faker::LoremFlickr.image(size: "300x300"),
    store_shelf: StoreShelf.all.sample,
  )
  end