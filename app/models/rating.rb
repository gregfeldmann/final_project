class Rating < ApplicationRecord
  # Direct associations

  belongs_to :entertainment

  belongs_to :user

  has_many   :recommends,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
