class Artifact < ApplicationRecord

  belongs_to :company_project

  mount_uploader :key, FileUploader

  MAX_FILESIZE = 10.megabytes

  validates :name, presence: true
  validates :name, uniqueness: true
  validate :uploaded_file_size

  private

  def uploaded_file_size
    if key.present? && key.file.size > self.class::MAX_FILESIZE

      errors.add(
        :key,
        "file size must be less than #{self.class::MAX_FILESIZE}"
      )

    end
  end

end