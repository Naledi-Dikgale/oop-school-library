# require_relative 'nameable'

# class Person < Nameable
#   # constructor
#   def initialize(age, parent_permission, name = 'unknown')
#     super()
#     # instance variables
#     @id = Random.rand(1..1000)
#     @name = name
#     @age = age
#     @parent_permission = parent_permission
#     @rentals = []
#   end
#   #  getters
#   attr_reader :id, :parent_permission, :rentals
#   attr_accessor :name, :age

#   def can_use_services?
#     return true if of_age?

#     false
#   end

#   def correct_name
#     @name
#   end

#   def add_rental(book, date)
#     Rental.new(date, book, self)
#   end

#   #   private function

#   private

#   def of_age?
#     return true if @age >= 18

#     false
#   end
# end

require_relative 'nameable'
require 'json'

class Person < Nameable
  attr_reader :id, :parent_permission, :rentals
  attr_accessor :name, :age

  def initialize(age, parent_permission, name = 'unknown')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age?
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def to_json(*args)
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      rentals: @rentals.map(&:to_json)
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    new(
      data['age'],
      data['parent_permission'],
      data['name']
    ).tap do |person|
      person.instance_variable_set('@id', data['id'])
      person.instance_variable_set('@rentals', data['rentals'].map { |rental| Rental.from_json(rental) })
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
