class UserAvatarCropForm
  attr_accessor :x, :y, :w, :h

  include Extras
  include UserAvatarActiveModel
  include UserAvatarValidations

  def call(args={})
    self.assign_attributes(args)
    valid = valid?

    if valid
      run_callbacks :save do
        avatar.manipulate! do |img|
          size = w << 'x' << h
          offset = '+' << x << '+' << y
          img.crop("#{size}#{offset}")
          img
        end
      end
      true
    end
  end

end
