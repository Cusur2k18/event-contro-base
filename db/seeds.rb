# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?

  # Create user super-admin and admin
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', super_admin: true)
  AdminUser.create!(email: 'test@test.com', password: 'testing123', password_confirmation: 'testing123', super_admin: false)
  AdminUser.create!(email: 'test2@test.com', password: 'testing123', password_confirmation: 'testing123', super_admin: false)


  careers = [
    'Telematica',
    'Psicologia',
    'Medicina',
    'Derecho',
    'Biotecnologias',
    'Veterinaria',
    'Nutricion'
  ]


  # Events
  70.times do
    Event.create(
      uuid: SecureRandom.uuid,
      name: Faker::Name.unique.name,
      career: careers.sample,
      description: Faker::Matz.quote,
      location: Faker::Nation.capital_city,
      start_date: Faker::Time.between(3.days.ago, Date.today),
      end_date: Faker::Time.between(Date.today, 3.days.from_now),
      admin_user_id: 1
    )
  end
  50.times do
    Event.create(
      uuid: SecureRandom.uuid,
      name: Faker::RickAndMorty.quote,
      career: careers.sample,
      description: Faker::Matz.quote,
      location: Faker::Nation.capital_city,
      start_date: Faker::Time.between(3.days.ago, Date.today),
      end_date: Faker::Time.between(Date.today, 3.days.from_now),
      admin_user_id: 2
    )
  end

  # Students
  200.times do
    Student.create(
      student_code: Faker::Code.unique.sin,
      career: careers.sample,
      grade: nil,
      email: nil,
      name: Faker::Name.unique.name
    )
  end

end