class ReferralMailer < ApplicationMailer
    default from: 'welcome@directshift.com'
    layout "mailer"
    def send_referral (email,referral)
        @referral = referral
      mail(to: email, subject: 'Welcome to DirectShift!')
    end
end
