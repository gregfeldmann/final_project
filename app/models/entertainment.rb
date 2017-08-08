class Entertainment < ApplicationRecord
  # Direct associations

  has_many   :recommends,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
