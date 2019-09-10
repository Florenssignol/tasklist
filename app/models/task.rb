class Task < ApplicationRecord
    include AlgoliaSearch
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings
    belongs_to :list

    accepts_nested_attributes_for :tags

    validates :name, presence: true
    validates :list_id, presence: true

    def all_tags=(names)
      self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
      end
    end
      
    def all_tags
      self.tags.map(&:name).join(", ")
    end

    algoliasearch do
      attributes :name, :description, :created_at
      searchableAttributes ['name', 'description']
      customRanking ['desc(created_at)']
      add_attribute :user_id
    end

    def user_id
      self.list.user_id
    end
    
end
