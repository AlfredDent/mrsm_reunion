class Detail < ApplicationRecord
    
    before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { maximum: 50 },
                      uniqueness: true
    validates :email, presence: true, length: { maximum: 255 },
                      format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i ,
                      uniqueness: { case_sensitive: false }
                      
    validates :phone, presence: true
    validates :attend, presence: true
    validates :batch, presence: true
    validates :seat, presence: true
    
end
