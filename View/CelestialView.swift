import SwiftUI

//Structure
/*
- At the top: title
     if it's OTD
     its name
- Body:
     image
     AR button if its AR is available
     description
     details
 */




struct CelestialView : View {
    
    
    
    var selectedCelestial : Celestial
    
    @State var comparisonOn : Bool = false
    
    //qui sarà salvato l'elemento selezionato nella pagina precedente
    //    @StateObject var selectedElem : String
    
    var body: some View{
        
            ZStack{
                
                backColor
                VStack(alignment: .leading){
                    
                    //
                    Text("Discover").font(.title).foregroundColor(.gray).padding(.leading, 20)
                    Text(selectedCelestial.name).font(.system(size: 50)).foregroundColor(.white).bold().padding(.leading, 20)
                    
                    ScrollView{
                        VStack(alignment: .center, spacing: 0){
                            
                            //image Celestial
                            //if comparison is OFF
                            if !comparisonOn || selectedCelestial.name == "Earth"{
                                
                                Image(selectedCelestial.image).padding(.bottom, 25)
                            } else {
                                    
                                //if comparison is ON
                                if selectedCelestial.big > 1{
                                    HStack(alignment: .center){
                                        Image(selectedCelestial.image).resizable().scaledToFit().padding(.bottom, 25).frame(height: 500)
                                    
//                                        Spacer()
                                        Image("earth").resizable().scaledToFit().frame(height: 500 / CGFloat( selectedCelestial.big) )
                                       
                                    }.padding(.leading, 10).padding(.trailing, 10)
                                } else if selectedCelestial.big < 1{
                                    
//                                    if selectedCelestial.name == "Venus" {
//
//                                        HStack(alignment: .center){
//                                            Image(selectedCelestial.image).resizable().scaledToFit().padding(.bottom, 25)
//
//                                                                            Image("earth").resizable().scaledToFit().frame(width: 500 * CGFloat(selectedCelestial.big), height: 500 * CGFloat(selectedCelestial.big)).padding(.bottom, 25)
//
//                                        }.padding(.leading, 10)
//                                    } else {
                                        HStack(alignment: .center){
                                            Image(selectedCelestial.image).resizable().scaledToFit().padding(.bottom, 25).frame( height: 500 * CGFloat(selectedCelestial.big))
                                        
                                                                            Image("earth").resizable().scaledToFit().padding(.bottom, 25)
                                        }.padding(.leading, 10).padding(.trailing, 10)
//                                    }
                                }
                                
                            }
                            
                            
                            
//                            HStack{
//                                //image Celestial
//                                Image(selectedCelestial.image).padding(.bottom, 25).frame(height: 500)
//
//                                if comparisonOn {
//                                    Image("earth").padding(.bottom, 25).frame(width: (500 * CGFloat(selectedCelestial.big)))
//                                }
//
//
//                            }
                            
                            
                            HStack{
                                
                                //AR button if AR is available
                                if selectedCelestial.isARavailable{
                                    Button {
                                        print("Look AR")
                                    } label: {
                                        Text(verbatim: "See AR").frame(width:80, height: 30, alignment: .center).padding(7).foregroundColor(.white)
                                    }.background(Color(red: 0.27, green: 0.27, blue: 0.52, opacity: 1)).clipShape(Rectangle()).cornerRadius(16, antialiased: false)
                                }
                                
                                if selectedCelestial.name != "Earth"{
                                    Button {
                                        comparisonOn = !comparisonOn
                                    } label: {
                                        Text(verbatim: "Compare to Earth").frame(width:150, height: 30, alignment: .center).padding(7).foregroundColor(.white)
                                    }.background(Color(red: 0.27, green: 0.27, blue: 0.52, opacity: 1)).clipShape(Rectangle()).cornerRadius(16, antialiased: true)
                                }
                                
                                
                                
                                

                                
                            }
                            
                            
                        }
                        //body section w/ description and details
                        VStack(alignment: .leading, spacing: 10){
                            //descrizione
                            Text("Description").bold().font(.title2)
                            
                            Text(verbatim: selectedCelestial.description).font(.body)
                            //tabella con dettagli e dati
                            //dettagli
                            Text("\nDetails").bold().font(.title2)
                            
                            //tabella con dettagli e dati
                            Text("Visibility").bold().font(.title3)
                        }.padding(.leading, 20).foregroundColor(.white)
                        
                        
                            
                        TableView(selectedCelestial: selectedCelestial)
                            
                        
                        
                    }.padding(.trailing, 20)
                    
                   
                }.padding(.top, 20)
                    
            }.foregroundColor(.white).background(backColor)
        
       
    }
}

//struct CelestialView_Previews: PreviewProvider {
//    static var previews: some View {
//        CelestialView(selectedCelestial: Celestial(name: "Mars", image: "mars", description: "abc", originName: "cia", isARavailable: true, big: 0.9, type: "Planet", nSatellites: 0))
//    }
//}
//
