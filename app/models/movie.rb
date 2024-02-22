class Movie < ApplicationRecord
has_many :bookmarks
validates :title, :overview, presence: true, allow_blank: false, uniqueness: true
end
