class User < ApplicationRecord
  include Authentication

  validates :name,
    on: [:create],
    presence: true
  validates :email,
    on: [:create],
    format: {with: URI::MailTo::EMAIL_REGEXP},
    uniqueness: true

  has_many :memberships, dependent: :destroy
  has_many :organizations, through: :memberships

  before_validation :strip_extraneous_spaces

  private

  def strip_extraneous_spaces
    self.name = self.name&.strip
    self.email = self.email&.strip
  end
end
