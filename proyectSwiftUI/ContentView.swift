//
//  ContentView.swift
//  proyectSwiftUI
//
//  Created by Luiggy Tamayo on 11/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{ // solo puede tener 10 views: VStask, spacer, botones,etc // es importante el tab
            
            BackgroudView(topColor: .blue, bottomColor: Color("lightBlue"))
            
            VStack{ // vs1
                
                cityTextView(cityName: "Guayaquil, ECU")
            
                mainWeatherView(imageName: "cloud.sun.fill", temperature: 40)//Vstack con  imagen y temperatura
                
                HStack (spacing: 25){
                    
                    WeatherDayView(dayOfWeek: "MON", ImageName: "sunrise.fill", temperature: 24) //sub vista extraida para acortar codigo
                    WeatherDayView(dayOfWeek: "TUE", ImageName: "cloud.fog.fill", temperature: 24) //sub vista extraida para acortar codigo
                    WeatherDayView(dayOfWeek: "WED", ImageName: "cloud.bolt.fill", temperature: 24) //sub vista extraida para acortar codigo
                    WeatherDayView(dayOfWeek: "THU", ImageName: "cloud.sun.fill", temperature: 24) //sub vista extraida para acortar codigo
                    WeatherDayView(dayOfWeek: "FRI", ImageName: "sunrise.fill", temperature: 24) //sub vista extraida para acortar codigo
                    
                }// .padding()
                
            Spacer()
                
                Button {
                    print("You activate the button")
                } label: {
                    
                    weatherButton(title: "Change day time", textColor: .blue, bgColor: .white) // hacer el boton reusable
                    
                }

            Spacer()
                
            }//Vs1
        }//zstack
    }//body
}


//=====================================Preview================================================//


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}



// ================================ Subviews ================================================//



struct WeatherDayView: View {
    
    var dayOfWeek : String
    var ImageName:String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .foregroundColor(.white)
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text("\(temperature)°")
                .foregroundColor(.white)
        }
    }
}

struct BackgroudView : View {
    
    //Las variable que no son view de declaran primoero
    var topColor : Color
    var bottomColor : Color
    
    var body: some View {
        
        LinearGradient(colors: [topColor, bottomColor], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct cityTextView: View{
    
    var cityName: String
    
    var body: some View{
        
               Text(cityName)
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .padding()
        
    }
}

struct mainWeatherView : View{
    
    var imageName: String
    var temperature : Int16
    
    var body: some View{
        
                VStack(spacing: 8){ // vs2 //  --los stacks tmb tiene parametros--
                    
                 Image(systemName: imageName)
                        .renderingMode(.original)
                        .resizable() //mostrar tamaño real
                        .aspectRatio(contentMode: .fit) //para que entre la imagagen dentro del frame
                        .frame(width: 180, height: 180) //acomodar el tamaño dentro de un frame
                    
                   Text("\(temperature)°")
                        .foregroundColor(.white)
                        .font(.system(size: 70, weight: .medium))
                    
                }.padding(.bottom,40) //vs2
    }
}

struct weatherButton: View{
    
    var title: String
    var textColor: Color
    var bgColor: Color
    
    var body: some View{
        
                    Text(title)
                        .frame(width: 280, height: 50)
                        .background(bgColor)
                        .foregroundColor(textColor)
                        .cornerRadius(10)
                        .font(.system(size: 20, weight: .medium))
        
    }
}
