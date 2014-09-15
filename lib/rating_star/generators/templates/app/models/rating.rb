class Rating < ActiveRecord::Base

  include Comparable

  html_schema_type :AggregateRating

  belongs_to :item,  polymorphic: true
  belongs_to :rater, polymorphic: true

  validates :value, inclusion: { in: (0..1) }

  after_initialize :set_defaults

  def set_defaults
    self.value      ||= 0
    self.vote_count ||= 1
  end

  def related
    self.item.ratings
  end

  def <=> other
    self.confidence_value <=> other.confidence_value
  end

  def confidence_value
    confidence * value
  end

  def uncertainty
    0.8 ** vote_count
  end

  def confidence
    1 - uncertainty
  end

end
