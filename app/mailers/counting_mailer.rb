class CountingMailer < ApplicationMailer
    default from: 'notifications@example.com'
 
    def automated_count
        @user_count = User.count
        @task_count = Task.count
        @task_done_count = Task.done.count
        mail(to: "toto@gmail.com", subject: 'Daily report')
    end
end
