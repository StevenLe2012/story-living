//
//  TreeHacks2024App.swift
//  TreeHacks2024
//
//  Created by Stanford User on 2/16/24.
//

import SwiftUI

@main
struct ARMemoryPalace: App {
    @State private var scan4ImmersionStyle: ImmersionStyle = .full
    var body: some Scene {
        WindowGroup(id: "Carousel") {
            SceneSelectionCarousel()
        }
        .windowStyle(.plain)

        WindowGroup(id: "TibetWindow") {
            VideoViewController(videoURL: Bundle.main.url(forResource: "Tibet", withExtension: "mov"))
        }

        WindowGroup(id: "ParisWindow") {
            VideoViewController(videoURL: Bundle.main.url(forResource: "Paris", withExtension: "mov"))
        }

        WindowGroup(id: "AppleParkWindow") {
            VideoViewController(videoURL: Bundle.main.url(forResource: "Summer23", withExtension: "mov"))
        }

        WindowGroup(id: "YosemiteWindow") {
            VideoViewController(videoURL: Bundle.main.url(forResource: "Yosemite", withExtension: "mov"))
        }

        ImmersiveSpace(id: "TibetSpace") {
            Immersive(entity: "Temple")
        }
        .immersionStyle(selection: $scan4ImmersionStyle, in: .full)

        ImmersiveSpace(id: "ParisSpace") {
            Immersive(entity: "Paris")
        }
        .immersionStyle(selection: $scan4ImmersionStyle, in: .full)

        ImmersiveSpace(id: "AppleParkSpace") {
            Immersive(entity: "ApplePark")
        }
        .immersionStyle(selection: $scan4ImmersionStyle, in: .full)

        ImmersiveSpace(id: "ElCapitanSpace") {
            Immersive(entity: "El Capitan")
        }
        .immersionStyle(selection: $scan4ImmersionStyle, in: .full)
    }
}
