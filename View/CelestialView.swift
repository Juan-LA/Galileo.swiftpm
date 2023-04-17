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
                    
                    ///Title
                    Text("Discover").font(.title).foregroundColor(.gray)
                    Text(selectedCelestial.name).font(.system(size: 50)).foregroundColor(.white).bold()
                    
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
                                    
                                        HStack(alignment: .center){
                                            Image(selectedCelestial.image).resizable().scaledToFit().padding(.bottom, 25).frame( height: 500 * CGFloat(selectedCelestial.big))
                                        
                                                                            Image("earth").resizable().scaledToFit().padding(.bottom, 25)
                                        }.padding(.leading, 10).padding(.trailing, 10)
                                }
                                
                            }
                            
                            
                            HStack{
                                
                                //AR button if AR is available
                                if selectedCelestial.isARavailable{
                                    Button {
                                        print("Look AR")
                                    } label: {
                                        Text(verbatim: "See AR").frame(width:80, height: 30, alignment: .center).padding(7).foregroundColor(.white)
                                    }.background(Color(red: 0.27, green: 0.27, blue: 0.52, opacity: 1)).clipShape(Rectangle()).cornerRadius(16, antialiased: false)
                                }
                                
                                ///Button "Compare to Earth"
                                if selectedCelestial.name != "Earth"{
                                    Button {
                                        comparisonOn = !comparisonOn
                                    } label: {
                                        Text(verbatim: "Compare to Earth").frame(width:150, height: 30, alignment: .center).padding(7).foregroundColor(.white)
                                    }.background(Color(red: 0.27, green: 0.27, blue: 0.52, opacity: 1)).clipShape(Rectangle()).cornerRadius(16, antialiased: true)
                                }
                                
                            }
                            
                        }
                        
                        ///Body section w/ description and details of the Celestial
                        VStack(alignment: .leading, spacing: 10){
                            ///Description
                            Text("Description").bold().font(.title2)
                            
                            Text(verbatim: selectedCelestial.description).font(.body)
                            
                            ///Name's origin
                            Text("Origin of the name").bold().font(.title2)
                            
                            Text(verbatim: selectedCelestial.originName).font(.body)
                            
                            ///Table with the details of the Celestial
                            Text("\nDetails").bold().font(.title2)
                            
                            
                        }.foregroundColor(.white)
                        
                        
                            
                        TableView(selectedCelestial: selectedCelestial)
                            
                        
                        
                    }
                    
                   
                }.padding(.top, 10).padding(.trailing, 30).padding(.leading, 30)
                    
            }.foregroundColor(.white).background(backColor)
        
       
    }
}

//struct CelestialView_Previews: PreviewProvider {
//    static var previews: some View {
//        CelestialView(selectedCelestial: Celestial(name: "Mars", image: "mars", description: "abc", originName: "cia", isARavailable: true, big: 0.9, type: "Planet", nSatellites: 0))
//    }
//}
//
