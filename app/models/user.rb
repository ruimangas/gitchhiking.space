class User < ApplicationRecord
  def self.from_omniauth(auth_hash)
    user = find_or_create_by(nickname: auth_hash['info']['nickname'])

    user.name = auth_hash['info']['name']
    user.email = auth_hash['info']['email']
    user.nickname = auth_hash['info']['nickname']
    user.uid = auth_hash['uid']
    user.starred = auth_hash['extra']['raw_info']['starred_url']

    user.tap { |u| u.save! }
  end
end
