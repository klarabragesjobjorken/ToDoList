//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Klara Björkén on 2023-08-18.
//

import SwiftUI

struct NewToDoView: View {
    
    @State var title: String
    @State var isImportant: Bool
    
    var body: some View {
        
        VStack{
            
            Text("Task title: ")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            TextField("Enter the task description...", text: $title)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            
            Toggle(isOn: $isImportant) {
                Text("Is this task important?")
                
            }
            .padding()
            
            Button(action: {
                
                
              
            }) {
                Text("Add task")
            }
            .padding()
            
        }
        
    }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(title: "", isImportant: false)
    }
}
