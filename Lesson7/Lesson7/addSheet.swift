//
//  addSheet.swift
//  Lesson7
//
//  Created by Batuhan Gözegü on 13.09.2025.
//

import SwiftUI

struct addSheet: View {
    
    @ObservedObject var viewModel: EventViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            Form{
                TextField("Event Name", text: $viewModel.title)
                DatePicker("Tarih:", selection: $viewModel.selectedDate)
                Picker("Tip Seç", selection: $viewModel.selectedType) {
                    ForEach(EventType.allCases,id:\.self){type in
                        Text(type.rawValue)
                    }
                }
                Toggle("Hatırlatıcı", isOn: $viewModel.hasReminder)
                    
                Section {
                    Button("Kaydet") {
                        viewModel.addEvent()
                        dismiss()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .listRowBackground(Color.blue)
                }
                
                
            }
            .navigationTitle("Yeni Event")            }
        
            
    }
}


#Preview {
    addSheet(viewModel: EventViewModel())
}
