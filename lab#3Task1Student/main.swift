//
//  main.swift
//  lab#3Task1Student
//
//  Created by Nazgul Atykhan on 18.02.2024.
//

import Foundation

struct Student {
    let firstName: String
    let lastName: String
    let averageGrade: Double
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

struct StudentJournal {
    var students: [Student]
    
    mutating func addStudent(firstName: String, lastName: String, averageGrade: Double) {
        let student = Student(firstName: firstName, lastName: lastName, averageGrade: averageGrade)
        students.append(student)
    }
    
    mutating func removeStudent(firstName: String, lastName: String) {
        if let index = students.firstIndex(where: { $0.firstName == firstName && $0.lastName == lastName }) {
            students.remove(at: index)
            print("Student \(firstName) \(lastName) removed successfully.")
        } else {
            print("Student \(firstName) \(lastName) is not in the journal.")
        }
    }
    
    func displayInfo() {
        print("Students in the journal:")
        for student in students {
            print("Name: \(student.fullName), GPA: \(student.averageGrade)")
        }
    }
    
    func DescendingGPA() {
        let sortedStudents = students.sorted(by: { $0.averageGrade > $1.averageGrade })
        print("Students sorted by descending GPA:")
        for student in sortedStudents {
            print("Name: \(student.fullName), GPA: \(student.averageGrade)")
        }
    }
    
    func averageGradeAS() -> Double {
        let totalGrades = students.reduce(0.0) { $0 + $1.averageGrade }
        return totalGrades / Double(students.count)
    }
    
    func studentWithHighestGPA() -> Student? {
        return students.max(by: { $0.averageGrade < $1.averageGrade })
    }
}

var journal = StudentJournal(students: [])
journal.addStudent(firstName: "Naz", lastName: "Atykhan", averageGrade: 3.6)
journal.addStudent(firstName: "Aizhan", lastName: "Demeubaeva", averageGrade: 3.3)
journal.addStudent(firstName: "Mira", lastName: "Tugelova", averageGrade: 3.7)
journal.addStudent(firstName: "Ulpa", lastName: "Nugmanova", averageGrade: 3.5)
journal.addStudent(firstName: "Matthew", lastName: "Seok", averageGrade: 3.8)
journal.addStudent(firstName: "Sunwoo", lastName: "Kim", averageGrade: 2.9)

print("Do you want to remove a student? (y/n)")
if let input = readLine()?.lowercased(), input == "y" {
    print("Enter the first name of the student you want to remove:")
    if let firstName = readLine(), !firstName.isEmpty {
        print("Enter the last name of the student you want to remove:")
        if let lastName = readLine(), !lastName.isEmpty {
            journal.removeStudent(firstName: firstName, lastName: lastName)
        }
    }
}

journal.DescendingGPA()

let averageGrade = journal.averageGradeAS()
print("Average grade of all students: \(averageGrade)")

if let topStudent = journal.studentWithHighestGPA() {
    print("Student with highest GPA: \(topStudent.fullName), GPA: \(topStudent.averageGrade)")
}
