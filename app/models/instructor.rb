class Instructor
  attr_reader :name
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def find_student_test(student_name, bt_name)
    BoatingTest.all.select do |test|
      test.student == student_name && test.bt_name == bt_name
    end
  end

  def pass_student(student_name, bt_name)
     if find_student_test(student_name, bt_name) != []
       find_student_test(student_name, bt_name).each do |test|
         test.bt_status = "passed"
       end
     else
       BoatingTest.new(student_name, bt_name, "passed", self)
     end
  end

  def fail_student(student_name, bt_name)
     if find_student_test(student_name, bt_name) != []
       find_student_test(student_name, bt_name).each do |test|
         test.bt_status = "failed"
       end
     else
       BoatingTest.new(student_name, bt_name, "failed", self)
     end
  end

end
