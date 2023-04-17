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
            ARViewContainer(selectedCelestial: selectedCelestial.image)
        }.background(.black)
        // Add the box anchor to the scene
    }
}


struct ARViewContainer: UIViewRepresentable {
    
    var selectedCelestial : String
    
    func makeUIView(context: Context) -> ARView {
        return ARView(frame: .zero)
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        showPlanet(uiView: uiView)
    }
    
    private func showPlanet(uiView: ARView) {
        uiView.scene.anchors.removeAll()
        
        
        let anchor = AnchorEntity()
        
        let fileURL = Bundle.main.url(forResource: selectedCelestial, withExtension: "reality")
        let planetScene = try! Entity.load(contentsOf: fileURL!)
        
      //  var boxAnchor = anchor.findEntity(named: "Marte")
        
        // Add the box anchor to the scene
        anchor.addChild(planetScene)
        anchor.scale = [1,1,1]
        anchor.position.y = -0.5
        
        uiView.scene.anchors.append(anchor)
       
    }
}
    
   

