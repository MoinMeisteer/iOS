//
//  ContentView.swift
//  SearchingMate
//
//  Created by Leon Langhauser on 22.06.22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authentication: Authentication
    var body: some View {
        NavigationView {
            VStack {
                Text("Authorized.. you are in!!")
                Image("Inside")
            }
            .padding()
            .navigationTitle("SearchingMate")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("log out") {
                        authentication.updateValidation(success: false)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
