//
//  Task.swift
//  Lesson5
//
//  Created by Batuhan Gözegü on 5.09.2025.
//

import Foundation

struct Task: Identifiable,Equatable {
    var id: UUID
    var title: String
    var isCompleted: Bool
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
