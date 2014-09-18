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

  def scale *args
    min, max = 0, 1                       if args.none?
    min, max = args[ :min ], args[ :max ] if args.one? && args.first.is_a? Hash
    min, max = 0, args.first              if args.one? && !args.first.is_a? Hash
    min, max = args.take( 2 )             if args.many?
  end
  
  def scaled
    value * ( max - min ) + min
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

  def weighted_value
    count * value
  end

  def % x
    scale x
  end

  def -@
    Rating.new( attributes.merge( count: -count ) )
  end

  def + x
    common_attributes = [ self, x ].common( &:attributes )
    total_count       = [ self, x ].sum( &:count )
    weighted_values   = [ self, x ].sum( &:weighted_value )
    average_value     = weighted_values / total_count
    result            = { value: average_value, count: total_count }
    Rating.new( common_attributes.merge( result ) )
  end

  def - x
    self + -x
  end

#*
#**
#+
#+@
#-
#-@
#/
#<
#<=
#<=>
#==
#===
#>
#>=

end
