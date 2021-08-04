class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title_include

    CLICKBAIT= [
        "Won't Believe",
        "Secret",
        "Top[number]",
        "Guess"
    ]

    def title_include
        if title.present? && CLICKBAIT.none? {|p| title.match(p)}
            errors.add(:title, "title not sufficiently clickbait-y")
        end
    end
end
