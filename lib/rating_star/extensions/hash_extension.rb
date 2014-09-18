module HashExtension

  extend ActiveSupport::Concern

  def & other
    select { |k| self[ k ] == other[ k ] }
  end

  def | other
    merge( other ) { nil }
  end

end

Hash.send( :include, RangeExtension )
