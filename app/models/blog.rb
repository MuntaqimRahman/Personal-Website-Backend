class Blog < ApplicationRecord
    validates :blog_title, length: {maximum: 100} ,presence: true
    validates :blog_content, presence: true

end
