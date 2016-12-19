"""
CPE 365 - Lab 1


Alex Ye, Nick Russo, Jon Kuzmich
"""
import sys
import time
import search as search
import analytics as analyze

# Constants
RUNNING = True;

"""
Parses data in given file and returns a Python list containing
a student's data in each index

StLastName, StFirstName, Grade, Classroom, Bus, GPA
"""
def parse_students(students, teachers):
    student_file = open(students)
    teacher_file = open(teachers)
    
    parsed_student_data = list()
    teacher_data = {}
    
    for line in teacher_file:
        teacher = line.strip().split(',')
        teacher_data[int(teacher[2])] = [teacher[0], teacher[1]]
        
    
    for line in student_file:
        person = line.strip().split(',')
        parsed_student_data.append([person[0], person[1], \
            int(person[2]), int(person[3]), int(person[4]), \
            float(person[5]), teacher_data[int(person[3])][0], \
            teacher_data[int(person[3])][1]]);

    return parsed_student_data

"""
Prints the usage of this application
"""
def print_usage():
    print(" Usage: \n\
            S[tudent] <lastname> [B[us]]\n\
            T[eacher] <lastname>\n\
            B[us] <number>\n\
            G[rade] <number> [[H[igh]]||[L[ow]]||[T[eacher]]\n\
            A[verage] <number>\n\
            C[lass] <number> [T[eacher]\n\
            An[alytics] [G[rade]||T[eacher]]||[B[us]]\n\
            Q[uit]");

# The data variable shall contain an individual student's data in each index
data = parse_students("list.txt", "teachers.txt")


if __name__ == "__main__":
    print_usage()
    while RUNNING:
        # print("Enter a search.");
        search_input = raw_input("Enter a search: ").lower().split(" ");
        
        # Checks if there are too many inputs
        if len(search_input) > 3:
            print("Improper usage. Too many inputs.");
            print_usage();
            RUNNING = False;
        else:
            # Gets the search type from the user input
            search_type = search_input[0].strip(":");

            # User exit command
            if (search_type == "quit" or search_type == "exit" or search_type == "q"):
                RUNNING = False;
                print("School Search has quit. Later alligator.");
            elif (len(search_type) == 0):
                print_usage();
            else:
                parameter = search_input[1];

                has_flag = len(search_input) == 3;
                if has_flag:
                    flag = search_input[2].lower();

                if ("s" == search_type or "student" == search_type):
                    if (has_flag):
                        if ("b" == flag or "bus" == flag):
                            search.last_name_bus_route(parameter, data); #R5
                        else:
                            print("Improper usage. The allowed Student search flags are B or Bus");
                            print_usage();
                    else:
                        search.last_name(parameter, data); #R4
                elif ("t" == search_type or "teacher" == search_type):
                    if (has_flag):
                        print("Improper usage. Flags are not allowed with a Teacher search.")
                        print_usage();
                    else:
                        search.students_in_class(parameter, data); #R6 requirement
                elif ("g" == search_type or "grade" == search_type):
                    if(parameter.isdigit()):
                        if (has_flag):
                            if ("h" == flag or "high" == flag):
                                search.highest_gpa(int(parameter), data);
                            elif ("l" == flag or "low" == flag):
                                search.lowest_gpa(int(parameter), data);
                            elif ("t" == flag or "teacher" == flag):
                                search.teachers_by_grade(int(parameter), data);
                            else:
                                print("Improper usage. The allowed Grade search flags are H, High, L, Low");
                                print_usage();
                        else:
                            print("nope")
                            search.students_in_grade(int(parameter), data);
                    else:
                        print("Imporper usage. The parameter to a Grade search must be a digit");
                        print_usage();
                elif ("b" == search_type or "bus" == search_type):
                    if (has_flag):
                        print("Improper usage. Flags are not allowed with a Bus search.")
                        print_usage();
                    else:
                        search.bus_route(int(parameter), data);
                elif ("a" == search_type or "average" == search_type):
                    if (has_flag):
                        print("Improper usage. Flags are not allowed with an Average search.")
                        print_usage();
                    elif (not parameter.isdigit()):
                        print("Improper usage. The parameter to a Average search must be a digit.");
                        print_usage();
                    else:
                        search.average(int(parameter), data); #R10 requirement
                elif ("c" == search_type or 'class' == search_type):
                    if (parameter.isdigit()):
                        if (has_flag):
                            if (flag == "t" or flag == "teacher"):
                                search.teacher_in_class(data, int(parameter))
                            else:
                                print ("Improper usage. The allowed Classroom search flags are T, Teacher.")
                        else:
                            search.student_in_class(data, int(parameter))
                    else:
                        print("Improper usage. The paramater to a Classroom search must be a digit.")
                elif (search_type == "an" or "analyze"):
                    if (parameter == "g" or parameter == "grade"):
                        analyze.student_grade_level(data)
                    elif (parameter == "t" or parameter == "teacher"):
                        analyze.teacher(data)
                    elif (parameter == "b" or parameter == "bus"):
                        analyze.bus_route(data)
                    else:
                        pass
                else:
                    print("Not supported search.");
                    print_usage();
