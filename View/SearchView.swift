//
//  SearchView.swift
//  
//
//  Created by Juan Liut on 16/04/23.
//

import SwiftUI

///Columns grid
let columns = [
    GridItem(.adaptive(minimum: 350))
]




struct SearchView: View {
    
    var statusBarColor: Color = .white {
    didSet {
    self.background(statusBarColor)
    }
    }
    
    ///Categories that will be displayed
    var categories : [String] = ["Planet", "Star", "Satellite"]
    
    var body: some View {
        
        NavigationView{
            
        ZStack{
            ///Background
            Image("wallpaper").resizable()
            
            VStack(alignment: .leading){
                
                HStack{
                    
                    ///Title
                    VStack(alignment: .leading){
                        Text("Explore the").foregroundColor(.gray).font(.title)
                        
                        Text("Solar System").bold().foregroundColor(.white).font(.title)
                    }
                    
                    Spacer()
                    
                    ///Info button
                    NavigationLink{
                        AboutView()
                    } label: {
                        Image(systemName: "info.circle").resizable().scaledToFill().foregroundColor(.white).frame(width: 30, height: 30)
                    }
                    
                }.padding(.bottom, 20).padding(.top, 20)
                
                ///List categories
                Spacer()
                
                ScrollView{
                    
                    VStack{
                        
                        ///Categories and tiles
                        ForEach(categories, id: \.self){
                            category in
                            
                            let temp = getListForType(nameType: category)
                            
                            ///Section and tiles
                            VStack(alignment: .leading){
                                
                                ///Title's section
                                Text("\(category)s").font(.title).bold().foregroundColor(.white)
                                
                                ///Grid with elements
                                LazyVGrid(columns: columns, alignment: .center, spacing: 20){
                                    ForEach(temp, id: \.self){
                                        elem in
                                        NavigationLink{
                                            CelestialView(selectedCelestial: elem)
                                        } label: {
                                            ZStack(alignment: .leading){
                                                ///Tile's background
                                square.cornerRadius(16, antialiased: false).foregroundColor(darkBackColor)
                                                
                                                HStack{
                                                    ///Celestial's name
                                                                      ZStack(alignment: .leading){
                                                        Text(elem.name).font(.system(size: 40)).bold().frame( alignment: .topLeading).padding(.leading, 30).padding(.bottom, 100).foregroundColor(.white)
                                                        Image( elem.image).resizable().scaledToFill().frame(width: 200, height: 500, alignment: .leading).padding(.trailing, -300).padding(.top, 200).padding(.leading, 140)
                                                    }
                                       }.frame(height: 200)
                                                
                                            }.frame( height: 200, alignment: .leading).cornerRadius(16, antialiased: false).padding(.leading, 10)
                                            
                                            
                                        }
                                        
                                    }
                                }.padding(.trailing, 10).padding(.bottom, 30)
                            
                            ///Divider
                            if category != "Satellite" {
                                
                                Divider().background(.white).padding(.leading).padding(.trailing).padding(.bottom, 10)
                                
                            }

                            }
                            
                        }.cornerRadius(16)
                    }
                    
                }
                    
                    
            }.padding(.leading, 40).padding(.trailing, 40)
              
        }.background(darkness).navigationBarBackButtonHidden()
            
        }.background(backColor)
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        
            SearchView()
        
    }
}
