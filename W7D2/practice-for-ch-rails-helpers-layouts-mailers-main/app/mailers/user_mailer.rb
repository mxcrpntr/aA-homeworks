class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        @url  = 'localhost:3000'
        mail(to: user.email, subject: 'Welcome to My Cat Site')
    end

end