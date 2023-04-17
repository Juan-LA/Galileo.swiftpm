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
    
    var planets : [Celestial] = getListForType(nameType: "Planet")
    var stars : [Celestial] = getListForType(nameType: "Star")
    var satellites : [Celestial] = getListForType(nameType: "Satellite")
    
    
    var body: some View {
        
        NavigationView{
        ZStack(alignment: .topLeading){
            ///Background
            backColor
            
            VStack(alignment: .leading){
                
                HStack{
                    
                    ///Title
                    VStack{
                        Text("Discover the").foregroundColor(.gray).font(.title)
                        
                        Text("Solar System").bold().foregroundColor(.white).padding(.leading, 20).font(.title)
                    }
                    
                    Spacer()
                    
                    ///Info button
                    NavigationLink{
                        AboutView()
                    } label: {
                        Image(systemName: "info.circle").resizable().scaledToFill().foregroundColor(.white).padding(.trailing, 40).frame(width: 30, height: 30)
                    }
                    
                }.padding(.bottom, 20)
                
//                Spacer()
                
                
                ScrollView{
                    
                    
                        ForEach(0...2, id: \.self){
                            n in
                            
                            if n == 0 {
                                ///Planets section
                                VStack(alignment: .leading){
                                    
                                    Text("Planets").font(.title).bold().foregroundColor(.white)
                                    
                                    LazyVGrid(columns: columns, alignment: .center, spacing: 20){
                                        ForEach(planets, id: \.self){
                                            planet in
                                            NavigationLink{
                                                CelestialView(selectedCelestial: planet)
                                            } label: {
                                                ZStack(alignment: .leading){
                                                    //background
                                                    square.cornerRadius(10, antialiased: false).foregroundColor(darkBackColor)
                                                    
                                                    HStack{
                                                        //category's name
                                                        ZStack(alignment: .leading){
                                                            Text(planet.name).font(.system(size: 40)).bold().frame( alignment: .topLeading).padding(.leading, 30).padding(.bottom, 100).foregroundColor(.white)
                                                            
                                                            Image( planet.image).resizable().scaledToFill().frame(width: 200, height: 500, alignment: .leading).padding(.trailing, -300).padding(.top, 200).padding(.leading, 140)
                                                        }
                                                        
                                                        
                                                        
                                                        //image
                                                        
                                                        
                                                    }.frame(height: 200)
                                                    
                                                }.frame( height: 200, alignment: .leading).cornerRadius(10, antialiased: false).padding(.leading, 10)
                                                
                                                
                                            }
                                            
                                        }
                                    }.padding(.trailing, 10).padding(.bottom, 20)
                                    
                                    Divider().background(.white).padding(.leading, 50).padding(.trailing, 50).padding(.bottom, 10)
                                    
                                }
                                
                            } else if n == 1 {
                                ///Planets section
                                VStack(alignment: .leading){
                                    Text("Stars").font(.title).bold().foregroundColor(.white)
                                    
                                    LazyVGrid(columns: columns, alignment: .center, spacing: 20){
                                        ForEach(stars, id: \.self){
                                            star in
                                            NavigationLink{
                                                //print(categoria.name)
                                                CelestialView(selectedCelestial: star)
                                                
                                            } label: {
                                                ZStack(alignment: .leading){
                                                    //background
                                                    square.cornerRadius(10, antialiased: false).foregroundColor(darkBackColor)
                                                    
                                                    HStack{
                                                        //category's name
                                                        ZStack(alignment: .leading){
                                                            Text(star.name).font(.system(size: 40)).bold().frame( alignment: .topLeading).padding(.leading, 30).padding(.bottom, 100).foregroundColor(.white)
                                                            
                                                            Image( star.image).resizable().scaledToFill().frame(width: 200, height: 500, alignment: .leading).padding(.trailing, -300).padding(.top, 200).padding(.leading, 140)
                                                        }
                                                        
                                                        
                                                        
                                                        //image
                                                        
                                                        
                                                    }.frame(height: 200)
                                                    
                                                }.frame( height: 200, alignment: .leading).cornerRadius(10, antialiased: false).padding(.leading, 10)
                                                
                                                
                                            }
                                            
                                        }
                                    }.padding(.trailing, 10).padding(.bottom, 20)
                                    
                                    Divider().background(.white).padding(.leading, 50).padding(.trailing, 50).padding(.bottom, 10)
                                    
                                }
                            } else if n == 2{
                                VStack(alignment: .leading){
                                    Text("Satellites").font(.title).bold().foregroundColor(.white)
                                    
                                    LazyVGrid(columns: columns, alignment: .center, spacing: 20){
                                        ForEach(satellites, id: \.self){
                                            satellite in
                                            NavigationLink{
                                                
                                                CelestialView(selectedCelestial: satellite)
                                                
                                            } label: {
                                                ZStack(alignment: .leading){
                                                    //background
                                                    square.cornerRadius(10, antialiased: false).foregroundColor(darkBackColor)
                                                   
                                                    HStack{
                                                        //category's name
                                                        ZStack(alignment: .leading){
                                                            Text(satellite.name).font(.system(size: 40)).bold().frame( alignment: .topLeading).padding(.leading, 30).padding(.bottom, 100).foregroundColor(.white)
                                                            
                                                            Image( satellite.image).resizable().scaledToFill().frame(width: 200, height: 500, alignment: .leading).padding(.trailing, -300).padding(.top, 200).padding(.leading, 140)
                                                        }
                                                        
                                                        
                                                        
                                                        //image
                                                        
                                                        
                                                    }.frame(height: 200)
                                                    
                                                }.frame( height: 200, alignment: .leading).cornerRadius(10, antialiased: false).padding(.leading, 10)
                                                
                                                
                                            }
                                            
                                        }
                                    }.padding(.trailing, 10).padding(.bottom, 20)
                                    
                                }
                                
                                
                                
                            }
                            
                            
                        }.cornerRadius(16).padding(.leading, 20).padding(.trailing, 20)
                    }
                    
                    
                }
                
                
                
                
                
        }.background(backColor)
            
            
            
            
        }.tint(Color(.white)).background(backColor).navigationBarBackButtonHidden()
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        
            SearchView()
        
    }
}
