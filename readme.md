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

Save the student to the database

```
me.save
```


Using the find/set/save syntax update the student's first name to taco

```
me.update_attributes(:first_name=>"Taco")
```

Delete the student (where first_name is taco). 

```
me = Student.find_by_first_name("Taco")
me.destroy
```

Validate that every Student's last name is unique

```
```


Validate that every Student has a first and last name that is longer than 4 characters

```
```


Validate that every first and last name cannot be empty

```
```


Combine all of these individual validations into one validation (using validate and a hash) 


```
```


Using the create syntax create a student named John Doe who is 33 years old

```
```


Show if this new student entry is valid

```
```


Show the number of errors for this student instance

```
```


In one command, Change John Doe's name to Jonathan Doesmith 

```
```


Clear the errors array

```
```


Save Jonathan Doesmith

```
```


Find all of the Students

```
```


Find the student with an ID of 128 and if it does not exist, make sure it returns nil and not an error

```
```


Find the first student in the table

```
```


Find the last student in the table

```
```


Find the student with the last name of Doesmith

```
```
Find all of the students and limit the search to 5 students, starting with the 2nd student and finally, order the students in alphabetical order

```
```

Delete Jonathan Doesmith

```
```


### Bonus
1. Use the validates_format_of and regex to only validate names that consist of letters (no numbers or symbols) and start with a capital letter
```
```
2. Write a custom validation to ensure that no one named Delmer Reed, Tim Licata, Anil Bridgpal or Elie Schoppik is included in the students table

```
```



