class User < ApplicationRecord
  def self.create_from_oauth(auth_hash)
    self.create(
      provider: auth_hash[:provider],
      uid: auth_hash[:uid],
      name: auth_hash[:info][:display_name],
      # image_url: auth_hash[:info][:images][0][:url],
      rspotify_hash: auth_hash.to_hash
    )
  end

  def self.from_oauth(auth_hash)
    # alternate method; recent styleguides favour .find_by
    # user = User.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])
    user = self.find_by(provider: auth_hash[:provider], uid: auth_hash[:uid])
    user || create_from_oauth(auth_hash)
  end
end
