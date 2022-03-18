class Task < ApplicationRecord
    validates :name,presence: true, length: {maximum: 30}
    validate :valisate_name_not_including_comma

    belongs_to :user
    
    scope :recent,-> {order(created_at: :desc)}
    
    private

    def valisate_name_not_including_comma
        errors.add(:name,'にカンマを加えることはできません') if name&.include?(',')
    end
end
