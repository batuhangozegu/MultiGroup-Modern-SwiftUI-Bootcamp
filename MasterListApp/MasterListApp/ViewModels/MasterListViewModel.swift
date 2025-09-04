//
//  MasterListViewModel.swift
//  MasterListApp
//
//  Created by Batuhan Gözegü on 3.09.2025.
//

import Foundation
import SwiftUI

class MasterListViewModel: ObservableObject {
    
    @Published var items: [ListItem] = []
    @Published var newListTitle: String = ""
    @Published var newListDescription: String = ""
    
    var incompletedItems: [ListItem] { items.filter{ !$0.isCompleted }}
    var completedItems: [ListItem] { items.filter{ $0.isCompleted }}
    
    let symbols: [String] = ["star.fill","heart.fill","moon.fill","cart.fill","book.fill"]
    init() {
        items = sampleItems
    }
    
    func addItem() {
         let title = newListTitle.trimmingCharacters(in: .whitespacesAndNewlines)
         let desc  = newListDescription.trimmingCharacters(in: .whitespacesAndNewlines)
         guard !title.isEmpty else { return }

         items.insert(ListItem(title: title, description: desc), at: 0)
         newListTitle = ""
         newListDescription = ""
     }
    
    func toggleCompletion(for list: ListItem) {
        if let index = items.firstIndex(where: { $0.id == list.id }) {
            items[index].isCompleted.toggle()
        }
    }
    
    func deleteFromIncomplete(at offsets: IndexSet) {
        let ids = offsets.map { incompletedItems[$0].id }
        items.removeAll { ids.contains($0.id) }
    }

    func deleteFromComplete(at offsets: IndexSet) {
        let ids = offsets.map { completedItems[$0].id }
        items.removeAll { ids.contains($0.id) }
    }
    
    func delete(byIDs ids: [UUID]) {
        items.removeAll { ids.contains($0.id) }
    }
    
    func randomTheme() -> Color {
        switch Int.random(in: 0..<5) {
        case 0:
            return .blue.opacity(0.2)
        case 1:
            return .green.opacity(0.2)
        case 2:
            return .yellow.opacity(0.2)
        case 3:
            return .purple.opacity(0.2)
        case 4:
            return .gray.opacity(0.2)
        default:
            return .red.opacity(0.2)
        }
    }

    
}
