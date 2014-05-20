class Like < ActiveRecord::Base
  default_scope -> {where(:live => true)}
  belongs_to :user
  belongs_to :idea

  validate :idea, uniqueness: { scope: :user }

  class << self
    def create_with_user_and_idea(user, idea)
      like = self.new(user_id: user.id, idea_id: idea.id)
      like.save
      like
    end
  end

  def unlike
    self.live = false
    self.save
  end

  def relike
    self.live = true
    self.save
  end
end
