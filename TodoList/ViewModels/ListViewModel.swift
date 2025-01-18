//
//  ListViewModel.swift
//  TodoList
//
//  Created by Jack Zheng on 18/1/2025.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            //retrieve data from the ItemsKey
            let data = UserDefaults.standard.data(forKey: itemsKey),
            //decode the data from the JSONencoded language, type object is [ItemModel] but not just the type - array - but the one its looping on specifically. get the data from 'data'
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
//        let newItems = [
//            ItemModel(title: "Buy milk", isCompleted: false),
//            ItemModel(title: "Learn SwiftUI", isCompleted: true),
//            ItemModel(title: "Go for a walk", isCompleted: false),
//        ]
//        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        // convert data into JSON code
        if let encodedData = try? JSONEncoder().encode(items) {
            // save encoded data into UserDefaults
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }

    
}
