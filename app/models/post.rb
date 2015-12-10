class Post < ActiveRecord::Base
	belongs_to :admin
	belongs_to :category

	validate :required_files

  extend FriendlyId
  friendly_id :title, use: :slugged

	private

	def required_files
		if title == ""
			errors[:base] << "Preencha o título."
		end
		if content == ""
			errors[:base] << "Preencha o campo de conteúdo."
		end
	end
end
