#encoding: utf-8

require_relative 'error/error.class.rb'

class Monster

  def initialize a, val
    @min = -2.0
    @max = 2
    
    if val > 0
      @val = val
      @pas = val.abs / 1000
    else
      Error::call "error, argument is different of 0"
    end
    
    if a >= 2
      @a = a
    else
      Error::call "error, argument a = #{a} is invalide. superior at 2 only"
    end
  end

  def calc
    tab = Array.new
    while @min <= @max
      k = 0.0
      y = 0.0
      while k < @val
        y = y + (Math.cos(@a**k * Math::PI * @min) / 2**k)
        k = k + 1
      end
      tab << y
      @min = @min + 0.01
    end
    return tab
  end
end
