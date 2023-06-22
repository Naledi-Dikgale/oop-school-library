require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, parent_permission, name = 'unknown')
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.includes?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
