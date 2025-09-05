//
//  TaskViewModel.swift
//  Lesson5
//
//  Created by Batuhan Gözegü on 5.09.2025.
//

import Foundation

class TaskViewModel : ObservableObject {
    
    @Published var task: [Task] = []
    @Published var newTaskTitle: String = ""
    
    
    func addTask() {
        let title = newTaskTitle.trimmingCharacters(in: .whitespaces)
        guard !title.isEmpty else { return }
        task.insert(Task(title: title),at: 0)
        newTaskTitle = ""
    }
    
    func delete(byIDs ids: [UUID]){
        task.removeAll { ids.contains($0.id) }
    }
    
    func toggleCompletion(for list: Task) {
        
        if let index = task.firstIndex(where: {$0.id == list.id}) {
            task[index].isCompleted.toggle()
        }
        
    }
    
    
}
