class List < ApplicationRecord
    has_many :tasks
    has_many :tags, through: :tasks
    belongs_to :user

    validates :name, presence: true
end
