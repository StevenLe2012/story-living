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
        ImmersiveSpace {
            PhotoCarouselView()
        }
            .immersionStyle(selection: $photoImmersionStyle, in: .mixed)
        
        ImmersiveSpace(id: "classroom") {
            Classroom()
        }
        .immersionStyle(selection: $classroomImmersionStyle, in: .full)
    }
}
