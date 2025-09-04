//
//  ListAddView.swift
//  MasterListApp
//
//  Created by Batuhan Gözegü on 4.09.2025.
//

import SwiftUI

struct ListAddView: View {
    @ObservedObject var viewModel : MasterListViewModel
    var theme : Color
    
    var body: some View {
        VStack(spacing: 30){
            
            ListTextField(text: $viewModel.newListTitle, placeholder: "Liste Başlığı")
            
            ListTextField(text: $viewModel.newListDescription, placeholder: "Açıklama")
            ListAddButton(action: {
                viewModel.addItem()
            }, isDisabled: viewModel.newListTitle.trimmingCharacters(in: .whitespaces).isEmpty
                || viewModel.newListDescription.trimmingCharacters(in: .whitespaces).isEmpty
                                     )
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(theme)
        
    }
}

#Preview {
    ListAddView(viewModel: MasterListViewModel(), theme: MasterListViewModel().randomTheme())
}
