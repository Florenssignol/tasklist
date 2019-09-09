class List < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :tags, through: :tasks
    belongs_to :user

    validates :name, presence: true

    def update_percentage
        number_of_tasks_in_list = tasks.count
        tasks_done = tasks.select{|task| task.done == true}
        count_task = tasks_done.count
        percentage = count_task * 100 / number_of_tasks_in_list
        self.update!(percentage_done: percentage)
    end
end
