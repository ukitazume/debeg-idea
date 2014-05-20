class User < ActiveRecord::Base
  has_many :ideas

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]

    User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
      user.image_url = image_url
    end
  end

  def like(idea)
    like = Like.unscoped.find_or_create_by(user_id: self.id, idea_id: idea.id)
    if like and like.updated_at != like.created_at
      like.relike
    end
    like
  end

  def like?(idea)
    (Like.where(user_id: self.id, idea_id: idea.id).count >= 1)
  end
end
