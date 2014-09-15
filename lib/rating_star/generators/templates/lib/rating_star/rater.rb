module Rater

  extend ActiveSupport::Concern

  included do
    has_many :ratings, as: 'rater'
  end

end
