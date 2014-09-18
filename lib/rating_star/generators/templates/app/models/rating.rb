class Rating < ActiveRecord::Base

  include Comparable

  html_schema_type :AggregateRating
  
  @scale = 0..1

  belongs_to :item,  polymorphic: true
  belongs_to :rater, polymorphic: true

  validates :value, inclusion: { in: (0..1) }

  after_initialize :set_defaults

  def set_defaults
    self.value ||= 0
    self.count ||= 1
  end

  def related
    item.ratings
  end
  
  def scaled_value( scale = class.scale )
    value * ( scale.max - scale.min ) + scale.min
  end

  def <=> other
    confidence_value <=> other.confidence_value
  end

  def confidence_value
    confidence * value
  end

  def uncertainty
    0.8 ** count
  end

  def confidence
    1 - uncertainty
  end

  def +@
    self
  end

  def -@
    Rating.new( attributes.merge( count: -count ) )
  end

  def + other
    operands      = self, other
    total_count   = operands.sum( &:count )
    average_value = operands.sum{ |x| (x.count/total_count)*x.value }
    Rating.new( operands.common( &:attributes ).merge( value: averagle_value, count: total_count ) )
  end

  def - other
    self + -other
  end

  def abs
    Rating.new( attributes.merge( count.abs ) )
  end
  
  def % n
    scaled_value( 0..n )
  end

#*
#**
#/

end
