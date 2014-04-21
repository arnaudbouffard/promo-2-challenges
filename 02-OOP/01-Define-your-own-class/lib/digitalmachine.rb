# my first class!
class DigitalMachine
  attr_accessor :family,:technology, :openhardware, :maker, :name
  def initialize(family, technology, openhardware, maker, name)
    @family = @technology = @openhardware = @maker = @name = ''
  end
end
