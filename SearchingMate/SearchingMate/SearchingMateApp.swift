//
//  SearchingMateApp.swift
//  SearchingMate
//
//  Created by Leon Langhauser on 22.06.22.
//

import SwiftUI

@main
struct SearchingMateApp: App {
    @StateObject var authentication = Authentication()
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated {
            ContentView()
                    .environmentObject(authentication)
            } else {
                LoginView()
                    .environmentObject(authentication)
            }
        }
    }
}
