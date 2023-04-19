//
//  SwiftUIView.swift
//
//
//  Created by Belinda Tagariello on 15/04/23.
//

import SwiftUI
import RealityKit

struct ArView : View {
    
    var selectedCelestial : Celestial
    
    var arView: ARView!
    let anchor = AnchorEntity()
    var body: some View {
        // Load the "Box" scene from the "Experience" Reality File
       // arView.frame = .zero
      //  arView.scene.anchors.removeAll()
        ZStack{
            Color(.black)
            ARViewContainer(selectedCelestial: selectedCelestial.image).tint(.white)
        }.background(.black)
        // Add the box anchor to the scene
    }
}


struct ARViewContainer: UIViewRepresentable {
    
    ///For rotation
    ///
    @State private var rotation = Angle.zero
    var rotationGesture: some Gesture {
            RotationGesture()
            
                .onChanged{ angle in
                    rotation = angle
                }
            
                .onEnded { angle in
                    rotation = angle
                }
            
        }
    
    var selectedCelestial : String
    
    func makeUIView(context: Context) -> ARView {
        
        return ARView(frame: .zero)
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        showPlanet(uiView: uiView)
        
    }
    
    private func showPlanet(uiView: ARView) {
        uiView.scene.anchors.removeAll()
        uiView.isUserInteractionEnabled = true
        
        let anchor = AnchorEntity()
        
        let fileURL = Bundle.main.url(forResource: selectedCelestial, withExtension: "reality")
        let planetScene = try! Entity.load(contentsOf: fileURL!)
 
        // Add the box anchor to the scene
        anchor.addChild(planetScene)
        
        if selectedCelestial == "sun"{
            anchor.scale = [3,3,3]
        } else if selectedCelestial == "mars"{
            anchor.scale = [1,1,1]
        }
        
        anchor.position.y = -0.5
        anchor.position.x = 0
        anchor.position.z = -2
        
        
        uiView.scene.anchors.append(anchor)
        
        
       
    }
}
    
   

