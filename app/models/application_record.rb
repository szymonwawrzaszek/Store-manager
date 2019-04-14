class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def has_photo?
    File.exists? photo_filename
  end

  PHOTO_STORE = File.join Rails.root, 'public', 'photo_store'

  def photo_filename
    File.join PHOTO_STORE, "#{id}.#{extension}"
  end

  def photo_path
    "/photo_store/#{id}.#{extension}"
  end

  def photo=(file_data)
    unless file_data.blank?
      @file_data = file_data
      self.extension = file_data.original_filename.split('.').last.downcase
    end
  end

  private
  def store_photo
    if @file_data
      FileUtils.mkdir_p PHOTO_STORE
      File.open(photo_filename, 'wb') do |f|
        f.write(@file_data.read)
      end
      @file_data = nil
    end
  end
end
