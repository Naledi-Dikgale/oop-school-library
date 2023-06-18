class Person
    attr_reader :id, :name, :age
  
    def initialize(name = "Unknown", age = 0, parent_permission = true)
      @id = SecureRandom.hex(4)
      @name = name
      @age = age
      @parent_permission = parent_permission
    end
  
    def name=(value)
      @name = value
    end
  
    def age=(value)
      @age = value
    end
  
    def of_age?
      age >= 18
    end
  
    def can_use_services?
      of_age? || @parent_permission
    end
  end
  