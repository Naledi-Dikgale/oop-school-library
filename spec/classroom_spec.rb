require_relative '../classroom'
require_relative '../student'

describe Classroom do
  let(:label) { 'Class A' }
  let(:student) { Student.new(nil, 15, true) }

  describe '#initialize' do
    it 'sets the label and initializes an empty array of students' do
      classroom = Classroom.new(label)
      expect(classroom.label).to eq(label)
      expect(classroom.students).to be_empty
    end
  end
end
