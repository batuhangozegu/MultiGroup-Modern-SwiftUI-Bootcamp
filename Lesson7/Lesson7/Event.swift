//
//  Event.swift
//  Lesson7
//
//  Created by Batuhan Gözegü on 13.09.2025.
//

import Foundation

enum EventType : String, CaseIterable {
    case Toplantı
    case Tatil
    case Spor
    case DogumGunu
    case Diger
}

struct Event : Equatable {
    var id: UUID
    var title: String
    var date: Date
    var type : EventType
    var hasReminder: Bool
    
    
    init(id: UUID = UUID(), title: String, date: Date, type: EventType, hasReminder: Bool) {
        self.id = id
        self.title = title
        self.date = date
        self.type = type
        self.hasReminder = hasReminder
    }
    
}
