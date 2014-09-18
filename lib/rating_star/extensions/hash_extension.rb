module HashExtension

  extend ActiveSupport::Concern

  def & other
    select { |k, v| other[ k ] == v }
  end

  def | other
    merge( other ) { |_, v1, v2| v1 == v2 ? v1 : nil }
  end

end

Hash.send( :include, RangeExtension )
