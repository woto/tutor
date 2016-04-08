class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/user/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [800, 800]

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path([version_name, "default_avatar.png"].compact.join('_'))
  end

end
