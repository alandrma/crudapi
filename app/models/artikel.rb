class Artikel < ApplicationRecord
    validates :judul, presence: true
    validates :isi, presence: true
    validates :media, presence: true
end
