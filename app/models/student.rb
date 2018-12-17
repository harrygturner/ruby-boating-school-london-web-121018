require "pry"

class Student
  attr_reader :first_name
  @@all = []

  def self.all
    @@all
  end

  def initialize(first_name)
    @first_name = first_name
    self.class.all << self
  end

  #bt ==> Boating Test

  def add_boating_test(bt_name, bt_status, instructor)
    BoatingTest.new(self, bt_name, bt_status, instructor)
  end

  def self.find_student(student_name)
    self.all.each do |student|
      if student.first_name == student_name
        return student
      end
    end
  end

  def student_tests
    BoatingTest.all.select do |test|
      test.student == self
    end
  end

  def test_passed
    count = 0
    student_tests.each do |test|
      if test.bt_status == "passed"
        count += 1
      end
    end
    count
  end

  def grade_percentage
    grade = test_passed/student_tests.length.to_f
    grade*100
  end

end

#Test Method

spongebob = Student.new("Spongebob")
patrick= Student.new("Patrick")

puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")

no_crashing = spongebob.add_boating_test("Don't Crash 101", "pending", puff)
power_steering_failure = patrick.add_boating_test("Power Steering 202", "failed", puff)
power_steering_pass = patrick.add_boating_test("Power Steering 202", "passed", krabs)

binding.pry
