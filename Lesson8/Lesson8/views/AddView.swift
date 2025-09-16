//
//  AddView.swift
//  Lesson8
//
//  Created by Batuhan Gözegü on 16.09.2025.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var vm : NoteViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            
            Form{
                
                Section(){
                    TextField("Title", text: $vm.noteTitle)
                    TextField("Content", text: $vm.noteContent)
                    
                }
                
                Section{
                    Button{
                        vm.addNote()
                        dismiss()
                    }label: {
                        Text("Add Todo")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .listRowBackground((!vm.noteTitle.isEmpty && !vm.noteContent.isEmpty) ? Color.green : Color.gray)
                    .disabled(vm.noteTitle.isEmpty || vm.noteContent.isEmpty)
                    
                }
            }
            
        }
    }
}

#Preview {
    AddView(vm:NoteViewModel())
}
