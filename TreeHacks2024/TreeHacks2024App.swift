//
//  TreeHacks2024App.swift
//  TreeHacks2024
//
//  Created by Stanford User on 2/16/24.
//

import SwiftUI

@main
struct ARMemoryPalace: App {
    @State private var photoImmersionStyle: ImmersionStyle = .mixed
    @State private var classroomImmersionStyle: ImmersionStyle = .full
    var body: some Scene {
        WindowGroup {
            SceneSelectionCarousel()
        }
        .windowStyle(.plain)

        ImmersiveSpace(id: "classroom") {
            Scan4()
        }
        .immersionStyle(selection: $classroomImmersionStyle, in: .full)
    }
}
