after 'schools', 'users' do
  puts 'Seeding school_admins (production, idempotent)'

  user = User.find_by(email: 'rkyankya@e-dalasa.com')

  School.all.each do |school|
    SchoolAdmin.where(user: user, school: school).first_or_create!
  end
end
