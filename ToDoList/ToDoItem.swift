//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Klara Björkén on 2023-08-18.
//

import Foundation

class ToDoItem : Identifiable {
    
    var title: String
    var isImportant: Bool
    var id = UUID()
    
    init(title: String, isImportant: Bool = false) {
            self.title = title
            self.isImportant = isImportant
        }
}
