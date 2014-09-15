module Rateable

  extend ActiveSupport::Concern

  included do
    has_many :ratings, as: 'item'
  end

  def rating
    ratings.build( value: ratings.average( :value ), vote_count: ratings.count )
  end

end
