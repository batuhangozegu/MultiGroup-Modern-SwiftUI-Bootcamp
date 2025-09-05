//
//  ContentView.swift
//  Lesson5
//
//  Created by Batuhan Gözegü on 5.09.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = TaskViewModel()
    
    
    var body: some View {
        VStack {
            HStack(spacing: 20){
                TextField("Görev Giriniz", text: $viewModel.newTaskTitle)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(style: StrokeStyle(lineWidth: 1))
                    )
                
                AddButton(action: {
                    viewModel.addTask()
                }, isDisabled: viewModel.newTaskTitle.trimmingCharacters(in: .whitespaces).isEmpty)
            }//HStack
            
            List{
                ForEach(viewModel.task) { task in
                    RowView(task: task,
                            toggleDone: {viewModel.toggleCompletion(for: task)}
                    )
                    .listRowBackground(Color.clear)
                    .swipeActions(edge:.trailing){
                        Button("Sil", role: .destructive){
                            viewModel.delete(byIDs: [task.id])
                        }
                    }
                }//foreach
                }//List
            .scrollContentBackground(.hidden)
                
            
        }//vstack
        .padding()
    }
}


struct RowView: View {
    
    let task : Task
    var toggleDone : () -> Void
    
    var body: some View {
        
        HStack{
            Button(action: toggleDone) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }.buttonStyle(.plain)
            Text(task.title)
                .strikethrough(task.isCompleted,color: Color(.black))
                .foregroundStyle(task.isCompleted ? .black : .red)
            Spacer()
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.gray).opacity(0.2))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.black.opacity(0.1),lineWidth: 1)
        )
        
        
    }
}



struct AddButton:View {
    
    var action: () -> Void
    var isDisabled: Bool = false
    
    var body: some View {
        Button(action: action ){
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .font(.system(size: 25,weight: .bold))
                .frame(height: 30)
                .padding(12)
                .background(isDisabled ? Color(.gray) : Color(.blue))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }

    }
}

#Preview {
    ContentView()
}
