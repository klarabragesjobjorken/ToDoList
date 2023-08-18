//
//  ContentView.swift
//  ToDoList
//
//  Created by Klara Björkén on 2023-08-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            
            HStack{
                
                Text("To Do List")
                    .font(.system(size: 35))
                    .fontWeight(.black)
                
                Spacer()
                
                Button(action: {
                    
                    
                                    
                }) {
                Text("Add")
                }
                
            }
            .padding()
            
            Spacer()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
