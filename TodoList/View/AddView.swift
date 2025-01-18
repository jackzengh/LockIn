//
//  AddView.swift
//  TodoList
//
//  Created by Jack Zheng on 18/1/2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var lvm: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Write here!", text: $textFieldText)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(15)
                
                Button(action: {
                    saveButtonPressed()
                }, label: {
                    Text("Save")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("AccentColor"))
                        .cornerRadius(15)
                        .foregroundStyle(.white)
                        .shadow(color: Color("AccentColor"),radius: 10, y: 10)
                })
                .padding(.horizontal, 100)
                .padding(.top, 20)
            }
            .padding()
        }
        .navigationTitle("Add an item 🖋️")
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
    func saveButtonPressed() {
        if textChecker() {
            lvm.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textChecker() -> Bool {
        if textFieldText.count <= 3 {
            alertTitle = "must be > 3 characters!! 💀"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

#Preview {
    NavigationView {
        AddView()
            .environmentObject(ListViewModel())
    }
}
