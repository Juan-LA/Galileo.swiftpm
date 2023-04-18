//
//  TableView.swift
//  
//
//  Created by Juan Liut on 17/04/23.
//

import SwiftUI

struct TableView: View {
    
    var selectedCelestial : Celestial
    
    var body: some View {
        ZStack{
            
            VStack{
                
            ///Stack with additional info
            
                
                if selectedCelestial.type.contains("Planet"){
                    
                    Group{
                        ///Place in the Solar System
                        HStack{
                            Text("Place inside the Solar System").foregroundColor(.white)
                            Spacer()
                            Text(String(getPosition(planet: selectedCelestial.name))).foregroundColor(.white)
                            
                        }.padding(.leading, 20).padding(.trailing, 20).padding(.top, 10)
                        
                        Divider().background(.white).padding(.leading, 20).padding(.trailing, 20)
                    }
                    
                }
                
                
                Group{
                    ///Type of celestial
                    HStack{
                        Text("Type ").foregroundColor(.white)
                        Spacer()
                        Text(selectedCelestial.type).foregroundColor(.white)
                        
                    }.padding(.leading, 20).padding(.trailing, 20).padding(.top, 10)
                    
                    Divider().background(.white).padding(.leading, 20).padding(.trailing, 20)
                }
                
                ///Number of satellites
                if selectedCelestial.type.contains("Planet"){
                    
                    
                    Group{
                        HStack{
                            Text("Number of satellites").foregroundColor(.white)
                            Spacer()
                            Text(String(selectedCelestial.nSatellites)).foregroundColor(.white)
                            
                        }.padding(.leading, 20).padding(.trailing, 20).padding(.top, 10)
                        
                        Divider().background(.white).padding(.leading, 20).padding(.trailing, 20)
                    }
                    
                    
                }
                
                ///Times bigger than Earth
                Group{
                    HStack{
                        Text("Times bigger than Earth ").foregroundColor(.white)
                        Spacer()
                        Text(String(selectedCelestial.big)).foregroundColor(.white)
                        
                    }.padding(.leading, 20).padding(.trailing, 20).padding(.top, 10)
                    
                    Divider().background(.white).padding(.leading, 20).padding(.trailing, 20)
                }
                
                ///Radius
                Group{
                    HStack{
                        Text("Radius").foregroundColor(.white)
                        Spacer()
                        Text(String(selectedCelestial.radius)).foregroundColor(.white)
                        
                    }.padding(.leading, 20).padding(.trailing, 20).padding(.top, 10)
                    
                    Divider().background(.white).padding(.leading, 20).padding(.trailing, 20)
                }
                
                ///Mass
                Group{
                    HStack{
                        Text("Mass").foregroundColor(.white)
                        Spacer()
                        Text(String(selectedCelestial.mass)).foregroundColor(.white)
                        
                    }.padding(.leading, 20).padding(.trailing, 20).padding(.top, 10)
                    
                    Divider().background(.white).padding(.leading, 20).padding(.trailing, 20)
                }
                
                ///Density
                Group{
                    HStack{
                        Text("Density").foregroundColor(.white)
                        Spacer()
                        Text(String(selectedCelestial.density)).foregroundColor(.white)
                        
                    }.padding(.leading, 20).padding(.trailing, 20).padding(.top, 10)
                    
                    Divider().background(.white).padding(.leading, 20).padding(.trailing, 20)
                }
                
                ///Maximum temperature
                HStack{
                    Text("Maximum temperature").foregroundColor(.white)
                    Spacer()
                    Text(String(selectedCelestial.tMax)).foregroundColor(.white)
                    
                }.padding(.leading, 20).padding(.trailing, 20).padding(.top, 10)
                
                Divider().background(.white).padding(.leading, 20).padding(.trailing, 20)
                
                ///Maximum temperature
                HStack{
                    Text("Minimum temperature").foregroundColor(.white)
                    Spacer()
                    Text(String(selectedCelestial.tMin)).foregroundColor(.white)
                    
                }.padding(.leading, 20).padding(.trailing, 20).padding(.top, 10).padding(.bottom, 20)
                
                
                
                
                
                
                
            }
//            .padding(.leading, 20).padding(.trailing, 20)
            
        
            
            
            
            
        }.background(darkBackColor).cornerRadius(16)
            .padding(.leading, 37).padding(.trailing, 37)
        }
    }


//struct TableView_Previews: PreviewProvider {
//    static var previews: some View {
//        TableView()
//    }
//}
