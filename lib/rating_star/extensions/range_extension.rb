module RangeExtension

  extend ActiveSupport::Concern

  def & x
    select { |k, v| x[ k ] == v }
  end

  def | x
    select { |k, v| x[ k ] == v }
  end

end

Range.send( :include, RangeExtension )
