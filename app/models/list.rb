class List < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :tags, through: :tasks
    belongs_to :user

    validates :name, presence: true
end
