//
//  ListView.swift
//  TodoList
//
//  Created by Jack Zheng on 18/1/2025.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var lvm: ListViewModel
    
    var body: some View {
        ZStack {
            if lvm.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 2.0)))
            }
            else {
                List {
                    ForEach(lvm.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    lvm.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: lvm.deleteItem)
                    .onMove(perform: lvm.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

#Preview {
    NavigationView {
        ListView()
            .environmentObject(ListViewModel())
    }
}


