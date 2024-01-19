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
    puts "kinds created!"
  end

end
