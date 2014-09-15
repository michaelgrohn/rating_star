module Rateable

  extend ActiveSupport::Concern

  included do
    has_many :ratings, as: 'rateable'
    has_many :raters, through: :ratings, class_name: :Person
  end

  def rating
    ratings.build( value: ratings.average( :value ), votes: ratings.count )
  end

end
