//
//  ListView.swift
//  MasterListApp
//
//  Created by Batuhan Gözegü on 3.09.2025.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel : MasterListViewModel
    var theme: Color
    var body: some View {
        
        List{
            
            Section(header: Text("Yapılacaklar").foregroundStyle(.gray)) {
                if viewModel.incompletedItems.isEmpty {
                    Text("Yapılacak yok.")
                }else {
                    ForEach(viewModel.incompletedItems){item in
                        NavigationLink {
                            DetailView(item: item, viewModel: viewModel,theme: theme)
                                }label: {
                                    ListRowView(
                                        list: item,
                                        toggleDone: { viewModel.toggleCompletion(for: item) },
                                        theme: theme
                                    )
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .swipeActions(edge: .trailing) {
                            Button("Sil", role: .destructive) {
                                viewModel.delete(byIDs: [item.id])
                            }
                        }
                    }//foreach
                    .onDelete{offsets in
                        viewModel.deleteFromIncomplete(at: offsets)
                    }
                }//else
            }//section
            
            Section(header: Text("Yapılanlar").foregroundStyle(.gray)) {
                if viewModel.completedItems.isEmpty {
                    Text("Daha hiç görev bitmemiş...").foregroundStyle(.secondary)
                }else {
                    ForEach(viewModel.completedItems){item in
                        NavigationLink {
                            DetailView(item: item, viewModel: viewModel,theme: theme)
                                } label: {
                                    ListRowView(
                                        list: item,
                                        toggleDone: { viewModel.toggleCompletion(for: item) },
                                        theme: theme
                                    )
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .swipeActions(edge: .trailing) {
                            Button("Sil", role: .destructive) {
                                viewModel.delete(byIDs: [item.id])
                            }
                        }
                    }//foreach
                    .onDelete { offsets in
                        viewModel.deleteFromComplete(at: offsets)
                    }
                }//else
            }//section

        }//list
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .listRowSeparator(.hidden)
        
    }//body
}
