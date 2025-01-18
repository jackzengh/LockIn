//
//  TodoListApp.swift
//  TodoList
//
//  Created by Jack Zheng on 18/1/2025.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var lvm: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(lvm)
            
        }
    }
}
