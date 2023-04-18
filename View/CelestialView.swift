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
    ///For the custom back button
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    
    @State var selectedCelestial : Celestial
    
    
    
    
    @State var comparisonOn : Bool = false
    
    //qui sarà salvato l'elemento selezionato nella pagina precedente
    //    @StateObject var selectedElem : String
    
    var body: some View{
        
        ///Text that will be "Justified"
        @State var description = selectedCelestial.description
        
        @State var origins = selectedCelestial.originName
        
        ZStack{
            
            ///Background
            Image("wallpaper").resizable()
            
            VStack(alignment: .leading){
                
                
//                NavigationLink{
//                    SearchView()
//                } label: {
//                    Image(systemName: "arrow.backward").foregroundColor(.white)
//                }.padding(.bottom, 10).padding(.leading, 40)
                
                ///Title
                Text("Discover").font(.title).foregroundColor(.gray).padding(.top, 20).padding(.leading, 40)
                Text(selectedCelestial.name).font(.system(size: 50)).foregroundColor(.white).bold().padding(.leading, 40)
                
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
                                NavigationLink {
                                    ArView(selectedCelestial: selectedCelestial).tint(.white).tint(.white)
                                } label: {
                                    Text(verbatim: "See AR").frame(width:80, height: 30, alignment: .center).padding(7).foregroundColor(.white)
                                }.background(btnColor).clipShape(Rectangle()).cornerRadius(16, antialiased: false)
                            }
                            
                            ///Button "Compare to Earth"
                            if selectedCelestial.name != "Earth"{
                                Button {
                                    comparisonOn = !comparisonOn
                                } label: {
                                    Text(verbatim: "Compare to Earth").frame(width:150, height: 30, alignment: .center).padding(7).foregroundColor(.white)
                                }.background(Color(red: 0.27, green: 0.27, blue: 0.52, opacity: 1)).clipShape(Rectangle()).cornerRadius(16, antialiased: true)
                            }
                            
                        }.padding(.bottom, 10)
                        
                    }.padding(.top, 10)
                    
                    ///Body section w/ description and details of the Celestial
                    VStack(alignment: .leading, spacing: 10){
                        ///Description
                        Text("Description").bold().font(.title2)
                        
                        
                        Text(verbatim: selectedCelestial.description).font(.body)
                        //
                        ///Name's origin
                        Text("Origin of the name").bold().font(.title2)
                        
                        Text(verbatim: selectedCelestial.originName).font(.body)
                        
                        ///Table with the details of the Celestial
                        Text("Details").bold().font(.title2)
                        
                        
                    }.padding(.leading, 35).padding(.trailing, 35).foregroundColor(.white)
                    
                    
                    
                    TableView(selectedCelestial: selectedCelestial)
                    
                    
                    
                }
                
                
            }.padding(.bottom, 40)
            
            
                    }.foregroundColor(.white).background(darkness).navigationBarBackButtonHidden(true)
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
