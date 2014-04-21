class OrangeTree
  attr_reader :height, :age
  attr_accessor :fruits_avail

  def initialize
    @age = @height = @fruits_avail = 0
    @alive = true
  end

  def bear_fruit
    if (5..9).to_a.include? @age
      @fruits_avail = 100
    elsif (10..15).to_a.include? @age
      @fruits_avail = 200
    else
      @fruits_avail = 0
    end
  end

  def pick_fruit(picks)
    @fruits_avail -= picks if @fruits_avail >= picks
  end

  def cheer_stroller
    puts "Howdie ho, I am #{@age} yrs old and #{@height} m high."
    if @fruits_avail > 0
      puts " I bear #{@fruits_avail} fruits. How many do you want to pick?"
      pick_fruit(gets.chomp.to_i)
      puts "Now I have #{@fruits_avail} fruits left."
    end
  end

  def alive?
    @alive
  end

  def lottery_o_life
    if (50..100).to_a.include? @age
        @alive = (rand()*10 > 9.5) ? false : true
    end
  end

  def one_year_passes!
    @height += 1 if @age < 10
    @age += 1
    bear_fruit
    cheer_stroller
    lottery_o_life
  end
end
