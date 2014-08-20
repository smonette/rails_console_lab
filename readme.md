## Console Lab

For this lab, we'd like you to strengthen your Rails console skills. This lab is going to be very familiar to the SQL lab, where we'll ask you to create a model and then write out the console commands you would use to execute these queries

### To Start

1. Create a model called Student, that has a first_name, last_name and age
2. Don't forget to run your migrations

### Tasks to create

Using the new/save syntax, create a student, first and last name and an age

```
me = Student.new
me.first_name = "Steph"
me.last_name = "Monette"
me.age = 25
```

##### Save the student to the database

```
me.save
```


##### Using the find/set/save syntax update the student's first name to taco

```
me.update_attributes(:first_name=>"Taco")
```

##### Delete the student (where first_name is taco).

```
me = Student.find_by_first_name("Taco")
me.destroy
```

##### Validate that every Student's last name is unique

In the student.rb file:

```
class Student < ActiveRecord::Base
  validates_uniqueness_of :last_name
end
```


##### Validate that every Student has a first and last name that is longer than 4 characters

In the student.rb file:


```
class Student < ActiveRecord::Base
  validates_length_of :first_name, minimum: 4
  validates_length_of :last_name, minimum: 4
end
```


##### Validate that every first and last name cannot be empty

In the student.rb file:

```
class Student < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
end

```


##### Combine all of these individual validations into one validation (using validate and a hash)


```
class Student < ActiveRecord::Base
	validates :first_name, :presence => true,
                       :length => {:minimum => 4}

	validates :last_name, :presence => true,
                      :length => {:minimum => 4},
                      :uniqueness => true
end
```


##### Using the create syntax create a student named John Doe who is 33 years old

```
john=Student.create(:first_name =>"John", :last_name => "Doe",:age=>33)
```


##### Show if this new student entry is valid

```
john.valid?
```


##### Show the number of errors for this student instance

```
john.errors.size
```
OR

```
john.errors.count
```

##### In one command, Change John Doe's name to Jonathan Doesmith

```
john.update_attributes(:first_name =>"Jonathan", :last_name => "Doesmith")
```


##### Clear the errors array

```
john.errors.clear
```


##### Save Jonathan Doesmith

```
john.save
```


##### Find all of the Students

```
Student.all
```


##### Find the student with an ID of 128 and if it does not exist, make sure it returns nil and not an error

```
Student.find_by_id(128)
```


##### Find the first student in the table

```
Student.first
```


##### Find the last student in the table

```
Student.last
```


##### Find the student with the last name of Doesmith

```
doesmith = Student.find_by_last_name("Doesmith")
```
##### Find all of the students and limit the search to 5 students, starting with the 2nd student and finally, order the students in alphabetical order

```
Student.all.limit(5).offset(1).order(last_name: :asc)
```

##### Delete Jonathan Doesmith

```
john = Student.find_by_last_name("Doesmith")
john.destroy
```


### Bonus
##### Use the validates_format_of and regex to only validate names that consist of letters (no numbers or symbols) and start with a capital letter

```
class Student < ActiveRecord::Base
  validates :first_name, :presence => true,
                         :length => {:minimum => 4},
                         :format => {:with => /\A[A-Z][a-zA-Z]+\z/}

  validates :last_name, :presence => true,
                        :length => {:minimum => 4},
                        :uniqueness => true,
                        :format => {:with => /\A[A-Z][a-zA-Z]+\z/}
end
```

##### Write a custom validation to ensure that no one named Delmer Reed, Tim Licata, Anil Bridgpal or Elie Schoppik is included in the students table

```
FORBIDDEN_FIRSTNAMES =[["Delmer", "Reed"],["Elie", "Schoppik"],["Anil","Bridgpal"],["Tim", "Licata"]]
  validate :username_is_allowed

def username_is_allowed
  if FORBIDDEN_FIRSTNAMES.include?([first_name, last_name])
    error.add(:first_name, "{first_name} is restricted")
  end
end

```



