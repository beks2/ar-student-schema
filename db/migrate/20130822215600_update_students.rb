require_relative '../config'
# require_??

# this is where you should use an ActiveRecord migration to 


class CreateStudents < ActiveRecord::Migration
  def up
      add_column :students, :name, :string
      Students.all.each do |student|
        student[:name] = '#{first_name} #{last_name}'
        student.save!
      end

      remove_column :students, :first_name
      remove_column :students, :last_name
  end


  def down
      add_column :students, :first_name
      add_column :students, :last_name

      Students.all.each do |student|
        name = student[:name].split(" ")
        student[:first_name] = name[0]
        student[:last_name] = name[1]
        student.save!
      end

      remove_column :students, :name
    end
  end
end
