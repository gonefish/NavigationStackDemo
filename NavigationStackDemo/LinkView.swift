//
//  LinkView.swift
//  NavigationStackDemo
//

import SwiftUI

struct LinkView: View {
    
    let title: String
    
    @Environment(\.myNavigationPath) var customValue
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            NavigationLink("Go Profile", value: AppViewRouter.profile)
            NavigationLink("Go Category List", value: AppViewRouter.category(.list))
            Button("Go Category Detail") {
                customValue.wrappedValue.append(AppViewRouter.category(.detail(999)))
                
            }
            Button("Back") {
                if !customValue.wrappedValue.isEmpty {
                    customValue.wrappedValue.removeLast()
                }
            }
            
            Button("Back to Root") {
                customValue.wrappedValue.removeAll()
            }
        }
        .padding()
        .navigationTitle(title)
    }
    
}

