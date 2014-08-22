require 'rails_helper'

RSpec.describe Student, :type => :model do
  it "creates a new student without saving to database" do
    tim = Student.new(:first_name => "Tim", :last_name => "Licata", :age => 30)
    expect(tim.first_name).to eq("Tim")
    expect(tim.last_name).to eq("Licata")
    expect(tim.age).to eq(30)
    expect(tim.new_record?).to eq(true)
  end

  it "saves the student to the database" do
    tim = Student.new(:first_name => "Timmy", :last_name => "Licata", :age => 30)
    expect(tim.new_record?).to eq(true)
    tim.save
    expect(tim.new_record?).to eq(false)
  end

  it "saves and can retreive student" do
    Student.create(:first_name => "Timmy", :last_name => "Licata", :age => 30)
    tim = Student.find_by_first_name("Timmy")
    expect(tim).not_to eq(nil)
  end
end
