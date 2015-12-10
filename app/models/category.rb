class Category < ActiveRecord::Base
  validate :name_required

  has_many :posts

  extend FriendlyId
  friendly_id :name, use: :slugged

  private

  def name_required
    if name == ""
      errors[:base] << "Preencha o campo nome."
    end
  end
end
