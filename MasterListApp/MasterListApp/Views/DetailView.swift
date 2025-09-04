//
//  DetailView.swift
//  MasterListApp
//
//  Created by Batuhan Gözegü on 4.09.2025.
//

import SwiftUI

struct DetailView: View {
    
    let item : ListItem
    @ObservedObject var viewModel : MasterListViewModel
    var theme: Color
    
    var body: some View {
        VStack(spacing: 50){
            
            Text(item.title)
                .font(.largeTitle)
            Text(item.description)
                .font(.headline)
            Image(systemName: viewModel.symbols.randomElement() ?? "square.and.arrow.up")
                .font(.system(size: 100))
            
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(theme)
        .navigationTitle("Detay")
    }
}

#Preview {
    DetailView(item: sampleItems[0], viewModel: MasterListViewModel(),theme: MasterListViewModel().randomTheme())
}
