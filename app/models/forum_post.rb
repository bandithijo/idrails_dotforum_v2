class ForumPost < ApplicationRecord
  belongs_to :user
  belongs_to :forum_thread, counter_cache: true

  validates :content, presence: true
end
