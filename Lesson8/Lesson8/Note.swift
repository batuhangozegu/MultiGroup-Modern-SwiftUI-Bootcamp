//
//  Note.swift
//  Lesson8
//
//  Created by Batuhan Gözegü on 16.09.2025.
//

import Foundation

struct Note : Identifiable,Codable,Equatable  {

    var id: UUID
    var title : String
    var content : String
    var date : Date
    
    
    init(id: UUID = UUID(), title: String, content: String, date: Date) {
        self.id = id
        self.title = title
        self.content = content
        self.date = date
    }
    
}
