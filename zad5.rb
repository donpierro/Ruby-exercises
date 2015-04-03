class Student
  include Comparable
  attr_accessor :name, :surname, :grade

  def initialize(name: "Johnny", surname: "Deep", grade: 2)
    @name, @surname, @grade = name, surname, grade
  end

  def to_s
    %(#{@name} #{@surname}: #{@grade})
  end

  def <=> other
    self.grade <=> other.grade
  end
end

class StudentGroup
  include Enumerable
  attr_accessor :students

  def initialize(students)
    @students = students
  end

  def count
    @students.size
  end

  def each(&block)
    @students.each do |student|
      if block_given?
        block.call student
      else
        yield student
      end
    end
  end
end