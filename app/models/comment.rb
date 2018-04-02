class Comment < ApplicationRecord
  belongs_to :request, required: false
  belongs_to :user, required: false
  validates :content, presence: true
end
