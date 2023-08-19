//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Klara Björkén on 2023-08-18.
//

import SwiftUI

struct NewToDoView: View {
    
    @Environment(\.managedObjectContext) var context
    
    @State var title: String
    @State var isImportant: Bool
    
    @Binding var showNewTask: Bool
    
    var body: some View {
        
        VStack{
            
            Text("Task title: ")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.purple)
                .padding()
            
            TextField("Enter the task description...", text: $title)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(30)
                .padding()
            
            Toggle(isOn: $isImportant) {
                Text("Is this task important?")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    
                
            }
            .padding()
            
            Button(action: {
                
                self.addTask(title: self.title, isImportant: self.isImportant)
                
                self.showNewTask = false
              
            }) {
                Text("Add task")
                    .font(.headline)
                    
                    
                    
            }
            .padding()
            
        }
        
    }
    
    private func addTask(title: String, isImportant: Bool = false) {
        
        let task = ToDo(context: context)
        task.id = UUID()
        task.title = title
        task.isImportant = isImportant
                
        do {
            try context.save()
            
        }
        
        catch {
            print(error)
            
        }
        
    }
    
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(title: "", isImportant: false, showNewTask: .constant(true))
    }
}
