//
//  ContentView.swift
//  NavigationStackDemo
//

import SwiftUI

enum AppViewRouter: Hashable {
    
    enum Category: Hashable {
        case list
        case detail(Int)
    }
    
    case profile
    case category(Category)
    
    var title: String {
        switch self {
        case .profile:
            return "Profile"
        case .category(let category):
            switch category {
            case .list:
                return "Category List"
            case .detail(let id):
                return "Category Detail: \(id)"
            }
        }
    }
}

private struct MyNavigationPathKey: EnvironmentKey {
    static let defaultValue: Binding<[AppViewRouter]> = .constant([AppViewRouter]())
}

extension EnvironmentValues {
    var myNavigationPath: Binding<[AppViewRouter]> {
        get { self[MyNavigationPathKey.self] }
        set { self[MyNavigationPathKey.self] = newValue }
    }
}

struct ContentView: View {
    
    @State
    private var presentedRouters: [AppViewRouter] = []
    
    var body: some View {
        NavigationStack(path: $presentedRouters) {
            LinkView(title: "Home")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: AppViewRouter.self) { park in
                    switch park {
                    case .profile:
                        LinkView(title: park.title)
                    case .category(let category):
                        switch category {
                        case .list:
                            LinkView(title: park.title)
                        case .detail(let id):
                            LinkView(title: park.title)
                        }
                    }
                }
        }
        .environment(\.myNavigationPath, $presentedRouters)
    }
}

#Preview {
    ContentView()
}
