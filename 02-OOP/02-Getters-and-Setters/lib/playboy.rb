class Playboy

  #TODO: implement necessary getters or setters to run meeting_casanova.rb

attr_reader :nationality, :conquests
attr_accessor :hair_length

  INITIAL_HAIR_LENGTH = 20  # beautiful long playboy hair

  def initialize(name, nationality)
    @conquests = []
    @name, @nationality = name, nationality
    @hair_length = INITIAL_HAIR_LENGTH
  end

#  def nationality
#    @nationality
#  end
#
#  def conquests
#    @conquests
#  end
#
#  def hair_length
#    @hair_length
#  end
#
#  def hair_length= neu_hair_length
#      @hair_length = neu_hair_length
#  end

  def meets(lady)
    @conquests << lady unless @married
  end

end
