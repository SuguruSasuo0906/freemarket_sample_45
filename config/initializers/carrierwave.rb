require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

def use_s3?
  ENV['AWS_ACCESS_KEY_ID'] && ENV['AWS_SECRET_ACCESS_KEY']
end

CarrierWave.configure do |config|
  if use_s3?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region: 'ap-northeast-1' #例 'ap-northeast-1'
    }

    config.fog_directory  = 'freemarket-sample-45'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarket-sample-45'
  end
end