# Preview all emails at http://localhost:3000/rails/mailers/school_admin_mailer
class SchoolAdminMailerPreview < ActionMailer::Preview
  def school_admin_added
    school_admin = SchoolAdmin.first
    user = User.new(name: Faker::Name.name)
    user.email = Faker::Internet.email(name: user.name)
    new_school_admin = SchoolAdmin.new(user: user, created_at: Time.zone.now)

    SchoolAdminMailer.school_admin_added(school_admin, new_school_admin)
  end

  def students_bulk_import_complete
    school_admin = SchoolAdmin.first
    course = Course.first
    report_params = { students_added: 10, students_requested: 12 }

    report_attachment = { mime_type: 'text/csv', content: "Sl. No,Email\n1, test@hey.com\n" }

    SchoolAdminMailer.students_bulk_import_complete(school_admin, course, report_params, report_attachment: report_attachment)
  end
end
