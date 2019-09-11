class List < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :tags, through: :tasks
    has_many :list_accesses, dependent: :destroy
    belongs_to :user

    validates :name, presence: true

    def update_percentage
        number_of_tasks_in_list = tasks.count
        tasks_done = tasks.select{|task| task.done == true}
        count_task = tasks_done.count
        percentage = count_task * 100 / number_of_tasks_in_list
        self.update!(percentage_done: percentage)
        if percentage == 100
            UserMailer.with(user: self.user, list: self).list_finished_email.deliver_later
        end
    end
end
