class Friend < ApplicationRecord
  # Direct associations

  belongs_to :sender,
             :class_name => "User"

  has_many   :recommends,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
