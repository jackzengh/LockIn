//
//  NoItemsView.swift
//  TodoList
//
//  Created by Jack Zheng on 18/1/2025.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let AccentColor = Color("AccentColor")
    let SecondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack (spacing: 16) {
                Spacer()
                Text("There are no items 😟")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Guys its about time to add something c'mon. Lock in lets get this.")
                    .font(.headline)

                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add something 😎")
                            .font(.headline)
                            .frame(height: 55)
                            .padding(.all, 4)
                            .frame(maxWidth: .infinity)
                            .background(animate ? AccentColor : SecondaryAccentColor)
                            .cornerRadius(15)
                            .foregroundStyle(.white)
                })
                .scaleEffect(animate ? 1.1 : 1.0)
                .shadow(color: animate ? AccentColor.opacity(0.7) : SecondaryAccentColor.opacity(0.7), radius: 10, x: 0, y: 20)
                .offset(y: animate ? 0 : 10)
                .padding(.horizontal, 50)
            }
            //portrait maxWidth is 350
            .frame(maxWidth: 400)
            .padding(.horizontal, 40)
            .multilineTextAlignment(.center)
            .onAppear(perform: getAnimation)
            .padding(.top, 50)
        }
        
    }
    
    func getAnimation() {
        guard !animate else {
            return
        }
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 0.5,
            execute: {
                withAnimation(
                    Animation
                        .easeInOut(duration: 2.0)
                        .repeatForever()
                ) {
                    animate.toggle()
                }
        })
    }
    
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("Title")
    }
    
}
