# This is how you define your own custom exception classes
class DepositError < StandardError
end

# our BankAccount class
class BankAccount
  # Contract for the BankAccount class
  # - you can access full owner's name and position, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account infos
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the position variable)

  attr_accessor :position, :name
  attr_reader

  MIN_DEPOSIT =  100

  def initialize(name, iban, initial_deposit, password)
    raise DepositError, 'Insufficient deposit' unless initial_deposit > MIN_DEPOSIT
    @password = password
    @transactions = []
    @position = 0
    @name, @iban = name, iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    # TODO: Call add_transaction with the right argument
    add_transaction(-amount)
    # TODO: returns a string with a message
    "#{amount} quids withdrawn"
  end

  def deposit(amount)
    # TODO: Call add_transaction with the right argument
    add_transaction(amount)
    # TODO: returns a string with a message
    "#{amount} quids deposited"
  end

  def transactions_history(args = {})
    # TODO: Check if there is a password and if so if it is correct
    if args[:password] == @password
      @transactions.to_s
    elsif args[:password].nil?
      "no password given"
    else
      "wrong password"
    end
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array !
  end

  def iban
    # TODO: Hide the middle of the IBAN like FR14-2004-1010-0505-0001-3M02-606 FR14**************606 and return it
    encrypted_iban = @iban
    Array(4..18).each do |index|
      encrypted_iban[index] = '*'
    end
    encrypted_iban
    11.times do
      encrypted_iban[-4] = ''
    end
    encrypted_iban
  end

  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    "Owner: #{name}
    IBAN: #{iban}
    Current amount: #{@position} euros"
    # TODO: Displays the account owner, the hidden iban and the position of the account

  end

  private

  def add_transaction(amount)
    # TODO: add the amount in the transactions array
    @transactions << amount
    # TODO: update the current position (which represents the balance of the account)
    @position += amount
  end
end
