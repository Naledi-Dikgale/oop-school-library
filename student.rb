require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, classroom, parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
