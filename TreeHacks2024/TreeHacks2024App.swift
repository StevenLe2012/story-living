//
//  TreeHacks2024App.swift
//  TreeHacks2024
//
//  Created by Stanford User on 2/16/24.
//

import SwiftUI

@main
struct ARMemoryPalace: App {
    var body: some Scene {
        WindowGroup {
            PrimaryWindow()
        }
        
        WindowGroup (id: "SecondWindow"){
            SecondWindow()
        }
    }
}
