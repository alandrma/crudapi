class Doctor < ApplicationRecord
    
    validates :fullname, presence: true
    validates :PracticeLocation, presence: true
    validates :specialist, presence: true
    validates :profile, presence: true
    validates :avatar, presence: true
    has_one_attached :avatar

end
