"""
CPE 365 - Lab 1


Alex Ye, Nick Russo, Jon Kuzmich
"""
import search as search
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
Provides analytics for students according to grade
"""
def student_grade_level(students):
    grades = list()

    for i in range(0, 10):
        grades.append(list())

    for student in students:
        grades[student[2] - 1].append(float(student[5]))

    for idx, grade in enumerate(grades):
        if(len(grade) > 0):
            print ("Grade: " + str(idx+1))
            analyze(grade)
            
"""
Provides analytics for students according to teacher.
"""
def teacher(students):
    teachers = {}

    for student in students:
        t_name = student[T_FIRST_NAME] + " " + student[T_LAST_NAME]
        if t_name not in teachers:
            teachers[t_name] = []
        teachers[t_name].append(student[GPA])
    
    for teacher, gpas in teachers.iteritems():
        if(len(gpas) > 0):
            print ("Teacher:" + teacher)
            analyze(gpas)

def bus_route(students):
    bus_route_dict = {}

    for student in students:
        bus_route = student[BUS];
        if bus_route not in bus_route_dict:
            bus_route_dict[bus_route] = []
        bus_route_dict[bus_route].append(student[GPA])
    
    for bus_route, gpas in bus_route_dict.iteritems():
        if(len(gpas) > 0):
            print ("Bus Route:" + str(bus_route))
            analyze(gpas)



"""
Helper function to print analytics.
"""
def analyze(grade):
    print ("Num of students: " + str(len(grade)))
    print ("Average: " + str(sum(grade)/len(grade)))
    print ("High/Low: " + str(max(grade)) + '/' + str(min(grade)))
    quotient, remainder = divmod(len(grade), 2)
    if remainder:
        print ("Median: " + str(sorted(grade)[quotient]) + '\n')
    else:
        print ("Median: " + str(sum(sorted(grade)[quotient - 1:quotient + 1]) / 2.) + '\n')

