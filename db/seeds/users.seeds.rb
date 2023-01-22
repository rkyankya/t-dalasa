after 'schools' do
  school = School.first

  puts 'Seeding users (production, idempotent)'

  school.users.where(email: 'rkyankya@e-dalasa.com').first_or_create!(name: 'Kyankya Raymond', title: 'System Admin', password: 'foobar')
end
