//
//  PrimaryWindow.swift
//  TreeHacks2024
//
//  Created by Jiahui Chen  on 2/17/24.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct PrimaryWindow: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
           NavigationSplitView {
                       VStack {
                           Button(action: {
                               openWindow(id: "SecondWindow")
                               print("Show Second Window")
                           }) {
                               Text("Show Second Window")
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
    PrimaryWindow()
}
