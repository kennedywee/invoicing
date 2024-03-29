class Line < ApplicationRecord
  belongs_to :lineable, polymorphic: true
  acts_as_list scope: %i[lineable_type lineable_id]
end
