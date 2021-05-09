class ContactMailer < ApplicationMailer
  
def send_when_admin_reply(user, contact)
    @user = user
    mail to: @user.email, subject: '会員登録が完了しました'
end

end