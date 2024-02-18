//
//  Test4BostonDynamics.swift
//  TreeHacks2024
//
//  Created by Jiahui Chen  on 2/17/24.
//


import RealityKit
import RealityKitContent
import SwiftUI

/// A model of the sun.
struct Immersive: View {
    var entity: String
    var scale: Float = 0.5
    var position: SIMD3<Float> = .zero

    /// The sun entity that the view creates and stores for later updates.
    @State private var scan4: Entity?

    var body: some View {
        RealityView { content in
            // Load your 3D model and add it to the scene
            if let local = try? await Entity(named: entity, in: realityKitContentBundle) {
                content.add(local)
            }
        }
    }

    /// Configures the model based on the current set of inputs.
    private func configure() {
        scan4?.scale = SIMD3(repeating: scale)
        scan4?.position = position
    }
}

#Preview {
    Immersive(entity: "Temple", scale: 0.1)
}
