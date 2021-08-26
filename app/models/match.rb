class Match < ApplicationRecord
  belongs_to :user_1, class_name: 'User'
  belongs_to :user_2, class_name: 'User'

  # search
  include PgSearch::Model
  pg_search_scope :search_by_matches,
  against: [ :user_1_id, :user_2_id ]
end
