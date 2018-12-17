class BoatingTest
  attr_reader :student, :bt_name, :instructor
  attr_accessor :bt_status
  @@all = []

  def self.all
    @@all
  end

  def initialize(student, bt_name, bt_status, instructor)
    @student = student
    @bt_name = bt_name
    @bt_status = bt_status
    @instructor = instructor
    self.class.all << self
  end

end
