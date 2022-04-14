//
//  PersonModel.swift
//  HW_02_04_MVC
//
//  Created by Anton Vassel on 14.04.2022.
//

struct User {
    let userLogin: String
    let userPassword: String
    let person: Person
    
    static func getUser() -> User {
        User(
            userLogin: "User",
            userPassword: "Password",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let firstName: String
    let surname: String
    let image: String
    
    var fullName: String {
        "\(firstName) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(firstName: "Anton", surname: "Vassel", image: "StarSKA")
    }
}
