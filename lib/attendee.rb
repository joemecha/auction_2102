class Attendee
  attr_reader :name,
              :budget

  def initialize(name: "Megan", budget: "$50")
    @name = name
    @budget = budget[1..-1].to_i
  end
end
