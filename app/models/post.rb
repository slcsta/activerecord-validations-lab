class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 } 
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid choice" }
    validate :title_invalid_if_not_clickbait


    def title_invalid_if_not_clickbait
        if title && !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "Title not clickbait-y")
        end
    end
end
