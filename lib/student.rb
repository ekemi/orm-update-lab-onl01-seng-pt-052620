require_relative "../config/environment.rb"

class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_accessor :name, :grade
  attr_reader :id
  def initialize(id = nil,name, grade)
    @id = id
    @name = name
    @grade = grade
  end

  def self.create_table
    sql ="
        CREATE TABLE IF NOT EXISTS students
        (id INTEGER PRIMARY KEY,
        name TEXT,
        grade INTEGER)"
    DB[:conn].execute(sql)
  end

  def self.drop_table

    sql = "DROP TABLE students"
      DB[:conn].execute(sql)
  end

def save
  sql = "INSERT INTO students(name, grade)
  VALUES(?,?)"
    DB[:conn].execute(sql, self.name,self.grade)
end

end
