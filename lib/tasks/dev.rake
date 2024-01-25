namespace :dev do
  desc "configure dev environment"
  task setup: :environment do
    puts "creating kinds..."
    kinds = %w(Friend Comercial Familiar)
    kinds.each do |kind|
      Kind.create!(
        description: kind 
      )
    end

    puts "kinds created!"
    puts "creating contacts..."

    100.times do |i| 
      Contact.create!(
        name: Faker::Name.name, 
        email: Faker::Internet.email, 
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "contacts created!" 

    puts "Register phones..."

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone, contact: contact)
        contact.save!
      end
    end

    puts "Phones created!"
  end
end
