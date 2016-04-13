class FavoriteEmployee < ActiveRecord::Base
  belongs_to :user
  belongs_to :person

  validates :person, uniqueness:{scope: :user, message: "user can add one person to favorites only once"}, presence: true
  validates :user, presence: true
end
