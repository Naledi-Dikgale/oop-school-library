require_relative '../student'

describe Student do
  let(:classroom) { double('classroom') }

  describe '#initialize' do
    it 'sets the classroom, age, parent_permission, and name' do
      student = Student.new(classroom, 15, true, 'John Doe')
      expect(student.classroom).to eq(classroom)
      expect(student.age).to eq(15)
      expect(student.parent_permission).to eq(true)
      expect(student.name).to eq('John Doe')
    end

    it 'sets the default name to "unknown" if not provided' do
      student = Student.new(classroom, 15, true)
      expect(student.name).to eq('unknown')
    end
  end

  describe '#play_hooky' do
    it 'returns a shrug emoticon' do
      student = Student.new(nil, 15, true)
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
