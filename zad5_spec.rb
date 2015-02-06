require './zad5.rb'

describe 'Student' do
  context 'create new student' do
    it 'returns student personal data' do
      student = Student.new(name: "Jan", surname: "Kowalski", grade: 5)
      expect(student.to_s).to eql(%(Jan Kowalski: 5))
    end

    it 'creates student with default data' do
      expect(Student.new.to_s).to eql(%(Johnny Deep: 2))
    end
  end

  context 'compare students' do
    let!(:student_default) { Student.new }
    let!(:student_kowalski) { Student.new(surname: "Kowalski", grade: 3) }

    it 'checks if second student have better grade' do
      expect(student_kowalski > student_default).to be true
    end
  end
end

describe 'StudentGroup' do
  let!(:st_with_grade_2) { Student.new }
  let!(:st_with_grade_3) { Student.new(grade: 3) }
  let!(:st_with_grade_4) { Student.new(surname: "Kowalski", grade: 4) }

  context 'method count' do
    it 'returns number of students' do
      expect(StudentGroup.new([st_with_grade_2, st_with_grade_3, st_with_grade_4]).count).to eql(3)
    end
  end

  context 'method map' do
    it 'returns students grades with one degree higher' do
      students = StudentGroup.new([st_with_grade_2, st_with_grade_3, st_with_grade_4])
      expect(
        students.map{ |student| student.grade + 1}
      ).to match_array([3, 4, 5])
    end

    it 'returns names of the students' do
      students = StudentGroup.new([st_with_grade_2, st_with_grade_3])
      expect(
        students.map{ |student| %(#{student.name} #{student.surname})}
      ).to match_array(["Johnny Deep", "Johnny Deep"])
    end
  end

  context 'method find and select' do
    let!(:students) { StudentGroup.new([st_with_grade_2, st_with_grade_3, st_with_grade_4]) }

    it 'returns students with grade better than 4' do
      expect(
        students.select{ |student| student.grade >= 4}
      ).to match_array([st_with_grade_4])
    end

    it 'returns students with surname Kowalski' do
      expect(
        students.find{ |student| student.surname.eql?("Kowalski") }
      ).to eql(st_with_grade_4)
    end
  end
end