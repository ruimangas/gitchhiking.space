class User < ApplicationRecord
  def self.from_omniauth(auth_hash)
    user = find_or_initialize_by(nickname: auth_hash['info']['nickname'])

    user.tap do |u|
      u.name = auth_hash['info']['name']
      u.email = auth_hash['info']['email']
      u.nickname = auth_hash['info']['nickname']
      u.uid = auth_hash['uid']
    end
  end
end
