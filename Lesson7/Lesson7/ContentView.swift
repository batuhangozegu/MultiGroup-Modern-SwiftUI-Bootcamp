//
//  ContentView.swift
//  Lesson7
//
//  Created by Batuhan Gözegü on 13.09.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAddSheet = false
    @StateObject private var viewModel = EventViewModel()
    
    
    
    
    
    var body: some View {
        
        NavigationStack{
            List {
                ForEach(viewModel.grouped) { section in
                    Section(header: Text(section.type.rawValue)) {
                        ForEach(section.items, id: \.id) { event in
                            NavigationLink(destination: detailView(event: event, viewModel: viewModel)) {
                                HStack(alignment: .firstTextBaseline, spacing: 12) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(event.title).font(.headline)
                                        Text(event.date.formatted(date: .abbreviated, time: .shortened))
                                            .font(.subheadline)
                                            .foregroundStyle(.secondary)
                                    }
                                    Spacer()
                                    if event.hasReminder {
                                        Image(systemName: "bell.fill")
                                            .imageScale(.small)
                                            .foregroundStyle(.orange)
                                    }
                                }
                             
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }//list
            .navigationTitle("Etkinlikler")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing)
                {
                    Button{
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }//toolbar item
            }//toolbar
        }//navigationStack
        .sheet(isPresented: $showAddSheet){
            addSheet(viewModel: viewModel)
                .presentationDetents([.medium ,.large])
        }
    }
}
#Preview {
    ContentView()
}
