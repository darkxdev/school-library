require_relative 'nameable'

class Person < Nameable
  attr_accessor :id, :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def to_json(*args)
    if is_a? Student
      { type: 'Student', name: @name, age: @age, parent_permission: @parent_permission, person_id: @id }.to_json(*args)
    elsif is_a? Teacher
      { type: 'Teacher', name: @name, age: @age, person_id: @id }.to_json(*args)
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
