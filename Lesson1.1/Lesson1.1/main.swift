//
//  main.swift
//  Lesson1.1
//
//  Created by Batuhan Gözegü on 17.08.2025.
//

import Foundation

enum Gender {
    case male
    case female
}

struct PersonelCard {
    var nickname: String?
    var name: String
    var surname: String
    var gender: Gender
    var age: Int
    var height: Double
    var isStudent: Bool
    var schoolName: String?
    var grade: Int?
    var instagram: String?
    
    init(nickname: String? = nil ,name: String, surname: String, gender: Gender, age: Int, height: Double, isStudent: Bool, schoolName: String? = nil, grade: Int? = nil, instagram: String? = nil) {
        self.nickname = nickname
        self.name = name
        self.surname = surname
        self.gender = gender
        self.age = age
        self.height = height
        self.isStudent = isStudent
        self.schoolName = schoolName
        self.grade = grade
        self.instagram = instagram
    }
}

var personelCard = PersonelCard(
    name : "Batuhan",
    surname : "Gözegü",
    gender : .male,
    age : 22,
    height : 1.75,
    isStudent :true,
    schoolName : "Tekirdağ Namık Kemal Üniversitesi",
    grade : 4,
    instagram: "batuhangozegu"
)


if let nickname = personelCard.nickname {
    print("\(nickname)")
}else {
    print("Nickname bulunamadı")
}

if let ig = personelCard.instagram {
    print("İnstagram: \(ig)")
}else {
    print("instagram bulunamadı")
}

print(personelCard)

print("Nickname:", personelCard.nickname ?? "—")
print("Instagram:", personelCard.instagram ?? "—")



