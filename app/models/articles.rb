class Articles < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    validates :media, presence: true
    has_one_attached :media
end
