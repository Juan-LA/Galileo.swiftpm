//
//  AboutView.swift
//  
//
//  Created by Juan Liut on 16/04/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
            ZStack{
                ///Background
                backColor
                
                VStack{
                    
                    ///Tile with personal info
                    ZStack(alignment: .top){
                        ///Background tile
                        Rectangle().background(darkBackColor).frame(height: 200).cornerRadius(16)
                        
                        ///Content
                        HStack{
                            
                        }
                        
                    }.padding(.leading, 20).padding(.trailing, 20)
                    
                }
                
            }.background(backColor)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
