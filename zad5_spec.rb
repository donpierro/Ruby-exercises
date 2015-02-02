require './zad5.rb'

describe 'Student' do
  context 'create new student' do
    it 'returns student personal data' do
      student = Student.new(name: "Jan", surname: "Kowalski", grade: 5)
      expect(student.about).to eql(%(Jan Kowalski: 5))
    end

    it 'creates student with default data' do
      expect(Student.new.about).to eql(%(Johnny Deep: 2))
    end
  end

  context 'compare students' do
    let!(:student_1) { Student.new }
    let!(:student_2) { Student.new(surname: "Kowalski", grade: 3) }

    it 'checks if students have the same surname' do
      expect(student_1.surname == student_2.surname).to be false
    end

    it 'checks if second student have better grade' do
      expect(student_2.grade > student_1.grade).to be true
    end
  end
end

describe 'StudentGroup' do
  let!(:student_1) { Student.new }
  let!(:student_2) { Student.new(grade: 3) }
  let!(:student_3) { Student.new(surname: "Kowalski", grade: 4) }

  context 'method count' do
    it 'returns number of students' do
      expect(StudentGroup.new([student_1, student_2, student_3]).count).to eql(3)
    end
  end

  context 'method map' do
    it 'returns students grades with one degree higher' do
      students = StudentGroup.new([student_1, student_2, student_3])
      expect(
        students.map{ |student| student.grade + 1}
      ).to match_array([3, 4, 5])
    end

    it 'returns names of the students' do
      students = StudentGroup.new([student_1, student_2])
      expect(
        students.map{ |student| %(#{student.name} #{student.surname})}
      ).to match_array(["Johnny Deep", "Johnny Deep"])
    end
  end

  context 'method find and select' do
    let!(:students) { StudentGroup.new([student_1, student_2, student_3]) }

    it 'returns students with grade better than 4' do
      expect(
        students.select{ |student| student.grade >= 4}
      ).to match_array([student_3])
    end

    it 'returns students with surname Kowalski' do
      expect(
        students.find{ |student| student.surname.eql?("Kowalski") }
      ).to eql(student_3)
    end
  end
end