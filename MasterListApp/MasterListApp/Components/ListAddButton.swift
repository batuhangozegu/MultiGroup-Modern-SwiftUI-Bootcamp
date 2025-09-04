//
//  ListAddButton.swift
//  MasterListApp
//
//  Created by Batuhan Gözegü on 3.09.2025.
//

import SwiftUI

struct ListAddButton: View {
    
    var action: () -> Void
    var isDisabled: Bool = false
    
    var body: some View {
        Button(action: action){
            Text("Add List")
                .foregroundStyle(.white)
                .font(.system(size: 30, weight: .bold))
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(isDisabled ? Color(.gray) : Color(.blue))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    ListAddButton(action: {
        print("sad")
    }, isDisabled: false)
}
