//
//  SecondaryWindow.swift
//  TreeHacks2024
//
//  Created by Jiahui Chen  on 2/17/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct SecondWindow: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
           NavigationSplitView {
               VStack {
                   Button(action: {
                       openWindow(id: "SecondWindow")
                       print("Show Second Window")
                   }) {
                       Text("Spawn another Window")
                           .font(.headline)
                           .padding()
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(10)
                   }
                   .buttonStyle(.plain)
                   
                   Button(action: {
                       dismissWindow(id: "SecondWindow")
                       print("Dismiss Second Window")
                   }) {
                       Text("Dismiss Second Window")
                           .font(.headline)
                           .padding()
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(10)
                   }
                   .buttonStyle(.plain)
               }
               .frame(maxWidth: .infinity, alignment: .top)
               .navigationTitle("Sidebar")
           } detail: {
               Text("Detail")
           }
           
       }
   }

#Preview {
    SecondWindow()
}
