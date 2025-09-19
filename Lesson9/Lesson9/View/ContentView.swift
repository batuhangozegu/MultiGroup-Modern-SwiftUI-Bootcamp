//
//  ContentView.swift
//  Lesson9
//
//  Created by Batuhan Gözegü on 19.09.2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Note.date,ascending: false)],
        animation: .default)
    private var notes : FetchedResults<Note>
    
    @State private var showingAddNote = false
    @State private var searchText = ""
    
    
    var filteredNotes: [Note] {
        if searchText.isEmpty {
            return Array(notes)
        }else {
            return Array(notes).filter { note in
                note.title?.localizedCaseInsensitiveContains(searchText) ?? false
            }
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
                SearchBar(text: $searchText)
                
                List{
                    ForEach(filteredNotes, id: \.objectID ){ note in
                        NavigationLink(destination: NoteDetailView(note: note)){
                            NoteListRowView(note: note)
                        }
                    }
                    .onDelete(perform: deleteNotes)
                }
                .listStyle(PlainListStyle())
            }//VSTACK
            .navigationTitle("Notlarım")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        showingAddNote = true
                    } ) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddNote){
                AddNoteView()
            }
        }//navigationview
    }
    
    
    private func deleteNotes(at offsets: IndexSet) {
        withAnimation {
            offsets.map { filteredNotes[$0]}.forEach(viewContext.delete)
        
            
            do {
                try viewContext.save()
            }catch {
                print("Hata \(error)")
            }
        }
    }
}

struct SearchBar: View {
    
    @Binding var text: String
    var body: some View {
    
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
            TextField("Search", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.horizontal)
    }
}
#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
