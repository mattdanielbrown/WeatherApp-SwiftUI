//
//  ContentView.swift
//  proyectSwiftUI
//
//  Created by Luiggy Tamayo on 11/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{ // solo puede tener 10 views: VStask, spacer, botones,etc
            LinearGradient(colors: [.blue,Color("lightBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)// es importante el tab
            
            VStack{ // vs1
                
               Text("Guayaquill, ECU")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .padding()
                
                
                VStack(spacing: 8){ // vs2 //  --los stacks tmb tiene parametros--
                    
                 Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable() //mostrar tamaño real
                        .aspectRatio(contentMode: .fit) //para que entre la imagagen dentro del frame
                        .frame(width: 180, height: 180) //acomodar el tamaño dentro de un frame
                    
                   Text("40°")
                        .foregroundColor(.white)
                        .font(.system(size: 70, weight: .medium))
                    
                }.padding(.bottom,40) //vs2
                
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
                    Text("Change day time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .font(.system(size: 20, weight: .medium))
                }

            Spacer()
                
            }//Vs1
        }//zstack
    }//body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
