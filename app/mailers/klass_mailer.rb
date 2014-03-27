class KlassMailer < ActionMailer::Base
  default from: "from@example.com"

  def klass_summary(email, klass)
    @klass = klass
    mail(to: email, subject: "Attendance summary for #{klass.name} on #{Date.today}")
  end
end
