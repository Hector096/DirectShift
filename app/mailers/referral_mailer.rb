class ReferralMailer < ApplicationMailer
    default from: 'welcome@directshift.com'
    layout "mailer"
    def send_referral (email,ref_user)
        @user = ref_user
      mail(to: email, subject: 'Welcome to DirectShift!')
    end
end
