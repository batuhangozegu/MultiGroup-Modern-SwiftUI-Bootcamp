//
//  ContentView.swift
//  Lesson8
//
//  Created by Batuhan Gözegü on 16.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = NoteViewModel()
    @State private var showSheet = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.notes) { note in
                    NavigationLink(destination: DetailView(note: note, vm: vm)) {
                        NoteListRowView(note: note)
                    }
                }
            }
            .listStyle(.plain)
            .listRowBackground(Color.clear)
            .scrollContentBackground(.hidden)
            .background(Color(.systemBackground))
            .navigationTitle("Notlar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { showSheet.toggle() } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                AddView(vm: vm)
                    .presentationDetents([.medium])
            }
        }
        .background(Color(.systemBackground).ignoresSafeArea())
    }
}


#Preview {
    ContentView()
}
