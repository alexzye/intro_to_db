"""
CPE 365 - Lab 1


Alex Ye, Nick Russo, Jon Kuzmich
"""
from __future__ import print_function
import time

# Constants
ST_LAST_NAME = 0;
ST_FIRST_NAME = 1;
GRADE = 2;
CLASSROOM = 3;
BUS = 4;
GPA = 5;
T_LAST_NAME = 6;
T_FIRST_NAME = 7;

"""
Prints last name, first name, and bus route of a given student last name
"""
def last_name_bus_route(student_last_name, students):
    start_time = time.time()
    found = False
    student_last_name = student_last_name.upper();
    found_students = list()
    for student in students:
        if(student[0] == student_last_name):
            found = True
            found_students.append(student[0] + ", " + student[1] + ", " + str(student[4]))
    end_time = time.time()

    if not found:
        print("No students found with that last name.")
    else:
        print_results(found_students, end_time - start_time)


"""
Prints the list of students in a teacher's class
"""
def students_in_class(teacher_last_name, students):
    start_time = time.time()
    student_list = []
    for student in students:
        t_last_name = student[6].lower()
        if t_last_name == teacher_last_name.lower():
            student_list.append(student)
    end_time = time.time()
    teacher_last_name = teacher_last_name.lower().upper()
    if len(student_list):
        for student in student_list:
            print("%s, %s" % (student[0].upper(), student[1].upper()))
    else:
        print("No teacher found with that last name.")
    print("This search took %f s." % (end_time - start_time))

"""
Prints the average GPA score for entries of a given grade
"""
def average(grade, students):
    start_time = time.time()
    total = []
    for student in students:
        if(student[2] == grade):
            total.append(student[5])
    end_time = time.time()
    try:
        print(str(grade) + ", " + str(sum(i for i in total)/len(total)))
    except:
        print("No students found in that grade")

    
    print("This search took %f s." % (end_time - start_time))

"""
Prints the students in a given grade level
"""
def students_in_grade(grade, students):
    start_time = time.time()
    student_list = []
    for student in students:
        if student[2] == grade:
            student_list.append(student)
    end_time = time.time()
    if len(student_list):

        for student in student_list:
            print("%s, %s" % (student[0].upper(), student[1].upper()))
    else:
        print("No students found in that grade.")
    print("This search took %f s." % (end_time - start_time))

            
"""
Prints the student with the highest GPA in a given grade level
"""
def highest_gpa(grade, students):
    start_time = time.time()
    high_student = ["", "", -1, -1, -1, -1.0, "", ""]
    for student in students:
        if student[2] == grade and student[5] > high_student[5]:
            high_student = student
    end_time = time.time()
    if high_student[2] == -1:
        print("No students found in that grade.")
    else:
        print(high_student[0] + ", " + high_student[1] + ", " + str(high_student[5]) \
            + ", " + high_student[6] + ", " + str(high_student[7]))

    print("This search took %f s." % (end_time - start_time))

"""
Prints the student with the lowest GPA in a given grade level
"""
def lowest_gpa(grade, students):
    start_time = time.time()
    low_student = ["", "", -1, -1, -1, 5.0, "", ""]
    for student in students:
        if student[2] == grade and student[5] < low_student[5]:
            low_student = student
    end_time = time.time()
    if low_student[2] == -1:
        print("No students found in that grade.")
    else:
        print(low_student[0] + ", " + low_student[1] + ", " + str(low_student[5]) \
            + ", " + low_student[6] + ", " + str(low_student[7]))
    print("This search took %f s." % (end_time - start_time))



def last_name(last_name, students):
    start = time.time();
    last_name = last_name.upper();
    result = list();
    for student in students:
        if student[ST_LAST_NAME] == last_name:
            formatted_student = format_last_name_search(student);
            result.append(formatted_student);
    if len(result) == 0:
        result =  "Sorry, there are no students with that last name";
    end = time.time();
    total = (end - start);
    print_results(result, total);
"""
Formats the students information for the last name search where grade, classroom and teacher are
desired in the answer.
"""
def format_last_name_search(student):
    # last name, first name, grade, classroom, teacher last name, teacher first name.
    formatted_student = student[ST_LAST_NAME] + ", " + student[ST_FIRST_NAME] + ", " + \
                        str(student[GRADE]) + ", " + str(student[CLASSROOM]) + ", " + \
                        student[T_LAST_NAME] + ", " + student[T_FIRST_NAME];
    return formatted_student;

"""
Given a bus route, find all students who take it;
"""
def bus_route(bus_route, students):
    start = time.time();
    result = list();
    for student in students:
        if student[BUS] == bus_route:
            formatted_student = format_bus_route_search(student);
            result.append(formatted_student);
    if len(result) == 0:
        result = "Sorry, there are no students that take that bus route.";
    end = time.time();
    total = (end - start);
    print_results(result, total);

"""
Formats the student information for the bus route search.
"""
def format_bus_route_search(student):
    formatted_student = student[ST_FIRST_NAME] + ", " + student[ST_LAST_NAME] + ", " + \
                        str(student[GRADE]) + ", " + str(student[CLASSROOM]);
    return formatted_student;

"""
Given a classroom, return all teachers teaching in it
"""
def teacher_in_class(students, classroom):
    start_time = time.time()
    teach_list = []
    for s in students:
        if s[CLASSROOM] == classroom:
            if [s[T_LAST_NAME], s[T_FIRST_NAME]] not in teach_list:
                teach_list.append([s[T_LAST_NAME], s[T_FIRST_NAME]])
    end_time = time.time()
    for teach in teach_list:
        print (teach[0] + ", " + teach[1])
    if not len(teach_list):
        print ("No teachers found using that classroom.")
    print ("This search took %f s." % (end_time - start_time))

"""
Given a classroom, return all students in class
"""
def student_in_class(students, classroom):
  start_time = time.time()
  found = False
  found_students = list()

  for student in students:
    if student[CLASSROOM] == classroom:
      found_students.append(str(student[0]) + ', ' + str(student[1]) + ', ' + str(student[2]))
      found = True
  end_time = time.time()
  if not found:
    print ("No students found in this list")
  else:
    print_results(found_students, end_time - start_time)

"""
Given a grade, find all the teachers who teach it.
"""
def teachers_by_grade(grade, students):
    start_time = time.time()
    result_list = list();
    for student in students:
        if int(student[GRADE]) == int(grade):
            teacher = student[T_FIRST_NAME] + ", " + student[T_LAST_NAME];
            if teacher not in result_list:
                result_list.append(teacher);
    end_time = time.time();
    if not len(result_list):
        print("There are no teachers currently teaching that grade.");
    else:
        print_results(result_list, end_time - start_time);

"""
Prints the result from a list and reports time
"""
def print_results(result_list, total_time):
    if (isinstance(result_list, str)):
        print(result_list);
    else:
        for result in result_list:
            print(result);
    print("The search took: %f s." % total_time);

