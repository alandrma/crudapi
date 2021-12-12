class Doctor < ApplicationRecord

    validates :fullname, presence: true
    validates :PracticeLocation, presence: true
    validates :specialist, presence: true
    validates :profile, presence: true
    
    has_one_attached :avatar
    def avatar_url
        Rails.application.routes.url_helpers.rails_blob_url(
        avatar.blob, only_path: true)
    end   
end
