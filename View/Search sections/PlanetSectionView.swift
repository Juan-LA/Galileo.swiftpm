//
//  PlanetSectionView.swift
//  
//
//  Created by Juan Liut on 18/04/23.
//

import SwiftUI


struct PlanetSectionView: View {
    
    var planets : [Celestial] = getListForType(nameType: "Planet")
    
    var body: some View {
        
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
                            ///Tile's background
                            square.cornerRadius(10, antialiased: false).foregroundColor(darkBackColor)
                            
                            HStack{
                                ///Category's name
                                                  ZStack(alignment: .leading){
                                    Text(planet.name).font(.system(size: 40)).bold().frame( alignment: .topLeading).padding(.leading, 30).padding(.bottom, 100).foregroundColor(.white)
                                    Image( planet.image).resizable().scaledToFill().frame(width: 200, height: 500, alignment: .leading).padding(.trailing, -300).padding(.top, 200).padding(.leading, 140)
                                }
                   }.frame(height: 200)
                            
                        }.frame( height: 200, alignment: .leading).cornerRadius(10, antialiased: false).padding(.leading, 10)
                        
                        
                    }
                    
                }
            }.padding(.trailing, 10).padding(.bottom, 20)
            
            Divider().background(.white).padding(.leading).padding(.trailing).padding(.bottom, 10)
            
        }
        
    }
}

struct PlanetSectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetSectionView()
    }
}
