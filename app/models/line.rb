class Line < ApplicationRecord
  belongs_to :lineable, polymorphic: true
end
