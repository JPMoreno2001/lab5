class Post < ApplicationRecord
  belongs_to :user

  after_create :update_counts

  private

  def update_counts
    self.user.increment!(:posts_count)
  end
end
