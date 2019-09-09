class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'
 
    def list_finished_email
        @user = params[:user]
        @list = params[:list]
        mail(to: @user.email, subject: 'Congratulation on doing all these tasks')
    end
end
