//
//  TreeHacks2024App.swift
//  TreeHacks2024
//
//  Created by Stanford User on 2/16/24.
//

import SwiftUI

@main
struct TreeHacks2024App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
