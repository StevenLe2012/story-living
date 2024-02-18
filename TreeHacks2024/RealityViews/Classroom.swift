//
//  Classroom.swift
//  TreeHacks2024
//
//  Created by Jiahui Chen  on 2/17/24.
//

import RealityKit
import RealityKitContent
import SwiftUI

/// A model of the sun.
struct Classroom: View {
    var scale: Float = 0.5
    var position: SIMD3<Float> = .zero

    /// The sun entity that the view creates and stores for later updates.
    @State private var classroom: Entity?

    var body: some View {
        RealityView { content in
             // Load your 3D model and add it to the scene
             do {
                 let local = try? await Entity(named: "Immersive", in: realityKitContentBundle)
                 content.add(local!)
             } catch {
                 print("Failed to load the model: \(error)")
             }
         }
    }

    /// Configures the model based on the current set of inputs.
    private func configure() {
        classroom?.scale = SIMD3(repeating: scale)
        classroom?.position = position
    }
}

#Preview {
    Classroom(scale: 0.1)
}
