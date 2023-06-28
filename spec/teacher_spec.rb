require_relative '../teacher'

describe Teacher do
  describe '#initialize' do
    it 'sets the age, specialization, name, and parent_permission' do
      teacher = Teacher.new(30, 'Math', 'John Doe', parent_permission: true)
      expect(teacher.age).to eq(30)
      expect(teacher.specialization).to eq('Math')
      expect(teacher.name).to eq('John Doe')
      expect(teacher.parent_permission).to eq(true)
    end

    it 'sets the default name to "unknown" if not provided' do
      teacher = Teacher.new(30, 'Math', parent_permission: true)
      expect(teacher.name).to eq('unknown')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      teacher = Teacher.new(30, 'Math', 'John Doe', parent_permission: true)
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
