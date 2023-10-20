class Article < ApplicationRecord
    include Visible

    has_many :comments, dependent: :destroy 

    validates :title, presence: true, uniqueness: true
    validates :content, presence: true, length: { minimum: 10 }
    has_rich_text :content

    

end


