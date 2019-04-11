require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.development? # 開発中もs3を使う
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory = 'nba-profile-image'
    config.asset_host = 'https://s3.amazonaws.com/nba-profile-image'
    # AWS側の設定を変えなくても、この１行の設定でアップロードできる？
    config.fog_public = false # ←コレ
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: '',
      aws_secret_access_key: '',
      region: 'ap-northeast-1'
    }
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
    #config.asset_host = 'https://s3.ap-northeast-1.amazonaws.com/nba-profile-image'
    #config.cache_storage = :fog
  end
end
