after 'schools' do
  school = School.first

  puts 'Seeding users (production, idempotent)'

  school.users.where(email: 'rkyankya@e-dalasa.com').first_or_create!(name: 'Admin User', title: 'Super Admin')
end
