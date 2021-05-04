class Blog < ApplicationRecord
    validates :title, length: {maximum: 100} ,presence: true
    validates :description, presence: true

end
