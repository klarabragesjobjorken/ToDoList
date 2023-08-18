//
//  ContentView.swift
//  ToDoList
//
//  Created by Klara Björkén on 2023-08-18.
//

import SwiftUI

struct ContentView: View {
    
    @State var toDoItems: [ToDoItem] = []
    @State private var showNewTask = false
    
    var body: some View {
        
        VStack{
            
            HStack{
                
                Text("To Do List")
                    .font(.system(size: 35))
                    .fontWeight(.black)
                
                Spacer()
                
                Button(action: {
                    
                    self.showNewTask = true
                                    
                }) {
                Text("Add")
                }
                
            }
            .padding()
            
            Spacer()
            
            List {
                
                ForEach (toDoItems) { ToDoItem in
                    if ToDoItem.isImportant == true {
                        Text("‼️" + ToDoItem.title)
                    } else {
                        Text(ToDoItem.title)
                    }
                    
                }
                
            }
            
            
        }
        
        if showNewTask {
            NewToDoView(title: "", isImportant: false, toDoItems: $toDoItems, showNewTask: $showNewTask)
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
