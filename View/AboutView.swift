//
//  AboutView.swift
//  
//
//  Created by Juan Liut on 16/04/23.
//

import SwiftUI




struct AboutView: View {
    ///For the custom back button
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
            ZStack{
                ///Background
                Image("wallpaper").resizable()
                
                VStack{
                    
                    ///Tile with personal info
                    ZStack(alignment: .topLeading){
                        ///Background tile
                        Rectangle().foregroundColor(darkBackColor).background(btnColor).frame(height: 300).cornerRadius(16)
                        
                        
                        ///Content
                        HStack(alignment: .center,spacing: 20){
                            ///Image
                            Rectangle().foregroundColor(.white).frame(width: 300, height: 300).cornerRadius(16)
                            
                            ///Presentation text
                            
                            
                        }
                        
                    }.padding(.leading, 40).padding(.trailing, 40)
                    
                    
                    Spacer()
                }
                
            }.background(darkness).foregroundColor(.white).navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
    }
    
    var backButton: some View {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white).padding(.leading, 20)
            }
        }
    
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
