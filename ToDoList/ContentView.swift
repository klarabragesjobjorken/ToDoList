//
//  ContentView.swift
//  ToDoList
//
//  Created by Klara Björkén on 2023-08-18.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(
        entity: ToDo.entity(),
        sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
        
    var toDoItems: FetchedResults<ToDo>
    
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
                        Text("‼️" + (ToDoItem.title ?? "No title"))
                        
                    }
                    
                    else {
                        Text(ToDoItem.title ?? "No title")
                        
                    }
                    
                    
                }
                .onDelete(perform: deleteTask)
                
            }
            
            
        }
        
        if showNewTask {
            NewToDoView(title: "", isImportant: false, showNewTask: $showNewTask)
            
        }
        
    }
    
    private func deleteTask(offsets: IndexSet) {
        
        withAnimation {
            offsets.map { toDoItems[$0] }.forEach(context.delete)

            do {
                try context.save()
                    
            }
            
            catch {
                print(error)
                
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
