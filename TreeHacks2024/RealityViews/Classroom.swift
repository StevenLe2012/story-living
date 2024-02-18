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
            if let local = try? await Entity(named: "Scene2", in: realityKitContentBundle) {
//                guard let resource = try? await EnvironmentResource(named: "ImageBasedLight") else { return }
//                let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 0.25)
//                local.components.set(iblComponent)
//                local.components.set(ImageBasedLightReceiverComponent(imageBasedLight: local))
                
                content.add(local)
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
