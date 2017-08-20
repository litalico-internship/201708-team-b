class Like < ApplicationRecord
  belongs_to :user, counter_cache: :likes_count
end
