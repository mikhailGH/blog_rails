class Article < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10}

  before_create :generate_slug

  def generate_slug
    self.slug = title.parameterize
  end

  def to_param
    slug
  end

end
