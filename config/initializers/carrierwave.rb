CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAJCNNLOK2EYFVQL3A',
    aws_secret_access_key: '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',
    region: 'us-east-1'
  }

  config.fog_directory  = 'nba-profile-photo'
  config.cache_storage = :fog
end
