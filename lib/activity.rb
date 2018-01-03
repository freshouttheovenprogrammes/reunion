class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participants(name, amount)
    participants[name] = amount
  end

  def calculate_total
    participants.inject(0) do |total, dollars|
      total += dollars[1]
    end
  end

  def split_costs(total)
    var = total / participants.count
    who_owes = []
    participants.each do |contribution|
      who_owes << contribution[0]
      who_owes << var - contribution[1]
    end
    who_owes
  end

end
