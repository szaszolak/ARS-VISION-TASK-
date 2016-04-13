class FavoriteCompany < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  validates :company, uniqueness:{scope: :user, message: "user can add one company to favorites only once"}, presence: true
  validates :user, presence: true
end
