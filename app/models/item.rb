class Item < ApplicationRecord

  has_many :orders through :ordereditem

  has_many :comments

  # validates :title, length: { minimum: 5 }, presence: true
  # validates :description, length: { minimum: 5 }, presence: true

  # mount_uploader :image, ImageUploader

  # extend FriendlyId
  # friendly_id :title, use: [:slugged, :history]

  # def should_generate_new_friendly_id?
    # title_changed? || slug.blank?
  # end

end