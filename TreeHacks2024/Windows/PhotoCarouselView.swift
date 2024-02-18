//
//  CarouselView.swift
//  TreeHacks2024
//
//  Created by Jiahui Chen  on 2/17/24.
//

import Combine
import Foundation
import RealityKit
import RealityKitContent
import SwiftUI

struct PhotoItem: Identifiable {
    var id: Int
    var title: String
    var color: Color
}

class PhotoStore: ObservableObject {
    @Published var items: [PhotoItem]
    
    let colors: [Color] = [.red, .orange, .blue, .teal, .mint, .green, .gray, .indigo, .black]

    // dummy data
    init() {
        items = []
        for i in 0...7 {
            let new = PhotoItem(id: i, title: "Item \(i)", color: colors[i])
            items.append(new)
        }
    }
}

struct PhotoCarouselView: View {
    @StateObject var store = PhotoStore()
    @State private var rotationAngle: Double = 0

    // Parameters for the circular layout
    let circleRadius: CGFloat = 300 // Radius of the circle on which photos will move
    let animationDuration: Double = 0.02 // Speed of rotation

    var body: some View {
        
        VideoViewController(videoURL: Bundle.main.url(forResource: "video1", withExtension: "MOV"))
        
        VideoViewController(videoURL: Bundle.main.url(forResource: "video2", withExtension: "MOV"))
        
        ZStack {
            ForEach(store.items.indices, id: \.self) { index in
                let item = store.items[index]
                ZStack {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(item.color)
                    Text(item.title)
//                        .font(.title2)
                        .padding()
                }
                .frame(width: 200, height: 200)
                .opacity(opacityEffect(index: index))
                .offset(x: xOffset(index: index))
                .offset(z: xOffset(index: index))
                .animation(Animation.linear(duration: animationDuration), value: rotationAngle)
            }
        }
        .offset(z: 500)
        .onAppear {
            // Timer to update rotationAngle and cause the rotation effect
            Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: true) { _ in
                self.rotationAngle += 0.2
                if self.rotationAngle >= 360 {
                    self.rotationAngle = 0
                }
            }
        }
    }
    
    func xOffset(index: Int) -> CGFloat {
        let angle = (Double.pi * 2 / Double(store.items.count)) * Double(index) + degreesToRadians(degrees: rotationAngle)
        return cos(angle) * circleRadius
    }
    
    func zOffset(index: Int) -> CGFloat {
        let angle = (Double.pi * 2 / Double(store.items.count)) * Double(index) + degreesToRadians(degrees: rotationAngle)
        return sin(angle) * circleRadius
    }
    
    func scaleEffect(index: Int) -> CGFloat {
        let angle = (Double.pi * 2 / Double(store.items.count)) * Double(index) + degreesToRadians(degrees: rotationAngle)
        // Simulate depth by scaling based on the cosine of the angle
        let scale = 0.6 + 0.4 * cos(angle) // Adjust scale factor as needed
        return scale
    }
    
    func opacityEffect(index: Int) -> Double {
        let angle = (Double.pi * 2 / Double(store.items.count)) * Double(index) + degreesToRadians(degrees: rotationAngle)
        // Simulate depth by adjusting opacity based on the cosine of the angle
        let opacity = 0.5 + 0.5 * cos(angle) // Adjust opacity factor as needed
        return opacity
    }
    
    func degreesToRadians(degrees: Double) -> Double {
        return degrees * Double.pi / 180
    }
}


#Preview {
    PhotoCarouselView()
}
