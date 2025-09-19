//
//  AddNoteView.swift
//  Lesson9
//
//  Created by Batuhan Gözegü on 19.09.2025.
//

import SwiftUI
import CoreData

struct AddNoteView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var content: String = ""
    
    var body: some View {
        NavigationView{
            VStack(spacing:16){
                TextField("Title", text: $title)
                    .font(.title2.bold())
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 23)
                            .fill(Color(.systemGray6))
                    )
                TextEditor(text: $content)
                    .font(.body)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 23)
                            .fill(Color(.systemGray6))
                    )
                    .frame(minHeight: 200)
                
                Spacer()
                
                Button(action: saveNote) {
                    Text("Kaydet")
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 23)
                                .fill(Color.blue)
                        )
                        .font(.system(size: 20, weight: .bold))
                }
                .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
            }
            .padding()
            .navigationTitle(Text("Yeni Not"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("İptal"){
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func saveNote(){
        withAnimation{
            
            let newNote = Note(context: viewContext)
            newNote.id = UUID()
            newNote.title = title
            newNote.content = content
            newNote.date = Date()
            
            do {
                try viewContext.save()
                dismiss()
            }catch {
                print("Hata \(error)")
            }
        }
    }
}

