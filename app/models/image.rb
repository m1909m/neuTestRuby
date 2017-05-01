class Image < ApplicationRecord
  mount_uploader :file, AttachmentUploader
end
