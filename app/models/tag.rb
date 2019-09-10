class Tag < ApplicationRecord
    include AlgoliaSearch
    has_many :taggings
    has_many :tasks, through: :taggings

    accepts_nested_attributes_for :tasks

    algoliasearch do
        attributes :name, :created_at
        searchableAttributes ['name']
        customRanking ['created_at']
    end
end
