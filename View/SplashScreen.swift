//
//  SplashScreen.swift
//
//
//  Created by Juan Liut on 14/04/23.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isVisible = false
    @State private var isActive = false
    
    
   
    var body: some View {
        
        
        ZStack{
            
            ///Background
            Image("wallpaper").resizable()
            
            ///Logo
            HStack{
                Image("logo")
                Text("Galileo").foregroundColor(.white).font(.system(size: 100)).bold()
                //            }.opacity(isVisible ? 1: 0).animation(.easeInOut (duration: 1))
                    .onAppear {
                        DispatchQueue.main.asyncAfter (deadline: .now()) {
                            isVisible = true
                        }
                        
                        
                    }
            }.background(darkness).onAppear {
                DispatchQueue.main.asyncAfter (deadline: .now() + 2) {
                    self.isActive = true
                }
            }
            }.fullScreenCover(isPresented: $isActive, content: {
                SearchView()}).background(darkness)
            
        
        
    }
}



struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
