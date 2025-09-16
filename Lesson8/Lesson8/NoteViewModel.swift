//
//  NoteViewModel.swift
//  Lesson8
//
//  Created by Batuhan Gözegü on 16.09.2025.
//

import Foundation

class NoteViewModel : ObservableObject{
    
    
    @Published var notes : [Note] = [
        Note(title:"Lesson8", content:"Ödev: Not Defteri Uygulaması", date: Date()),
    ]
    @Published var noteTitle : String = ""
    @Published var noteContent : String = ""
    
    private let userDefaultsKey : String = "notes"
    
    init(){
        loadNotes()
    }
    
    
    func addNote(){
        let title = noteTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        let content = noteContent.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !title.isEmpty && !content.isEmpty else { return }
        notes.insert(Note(title: title, content: content, date: Date()), at: 0)
        saveToUserDefaults()
        
        noteTitle = ""
        noteContent = ""

    }

    func deleteNote(byIds ids: [UUID]) {
        notes.removeAll { ids.contains($0.id) }
        saveToUserDefaults()
      }
    
    private func saveToUserDefaults(){
        if let encoded = try? JSONEncoder().encode(notes){
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    private func loadNotes() {
          if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
             let decoded = try? JSONDecoder().decode([Note].self, from: data) {
              notes = decoded
          }
      }
    
}
