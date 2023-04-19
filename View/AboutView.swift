//
//  AboutView.swift
//  
//
//  Created by Juan Liut on 16/04/23.
//

import SwiftUI

var presentation = "Hi,\nMy name is Juan David Liut Aymar and I'm a Swift Student and the developer of Galileo.\nI created this app because I was inspired by the wonder children show when they see planets and stars.\nI would therefore like to help them, but also all those who, like me, are passionate about astronomy, to learn more about the solar system, showing them 3D models and curious details about celestial bodies.\nDuring the creation of Galileo, I always focused on inclusivity as well: I would like anyone to be able to use it without problems. For this reason, the colors have been chosen in such a way as to offer maximum contrast and facilitate reading and the reading of descriptions is available through the built-in function in iOS \"Speak Screen\"."

var credits = "Credits\nLogo by Mattia Ballabio \n3D Models by NASA"


struct AboutView: View {
    ///For the custom back button
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
            ZStack{
                ///Background
                Image("wallpaper").resizable()
                
                VStack(alignment: .leading){
                    
                    Text("About the").foregroundColor(.gray).font(.title).padding(.leading, 40).padding(.top, 20)
                    
                    Text("Developer").bold().foregroundColor(.white).font(.title).padding(.leading, 40)
                    
                    ///Tile with personal info
                    ZStack(alignment: .topLeading){
                        ///Background tile
                        Rectangle().foregroundColor(darkBackColor).background(btnColor).frame(height: 500).cornerRadius(16)
                        
                        
                        ///Content
                        HStack(alignment: .center, spacing: 30){
                            ///Image
                            Image("photo").resizable().scaledToFill().frame(width: 300, height: 500).cornerRadius(16)
                            
                           
                                ///Presentation text
                            TextView(text: presentation).padding(.trailing, 30).padding(.top, 20)
                           }.frame(height: 500)
                        
                    }.padding(.leading, 40).padding(.trailing, 40)
                    
                    ///Credits
                    Text(credits).foregroundColor(.white).padding(.leading, 40).padding(.top, 20).opacity(0.5)
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
