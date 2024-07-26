//
//  SearchAppApp.swift
//  SearchApp
//
//  Created by Nika Pauluchenka on 25.07.24.
//

import SwiftUI

@main
struct SearchAppApp: App {
    var body: some Scene {
        let apiViewModel = ApiViewModel()
        WindowGroup {
            ContentView()
                .environmentObject(apiViewModel)
        }
    }
}
