//
//  LocationView.swift
//  My Tesla
//
//  Created by vipin on 21/03/25.
//


import SwiftUI
import MapKit


struct carLocation : Identifiable {
    let id = UUID()
    let latitude : Double
    let longitude : Double
    var corrdinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}






let locationView = [carLocation(latitude: 40.7484, longitude: -73.9857)]








struct LocationView: View {
    @Environment(\.dismiss) var gaya
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.7484, longitude: -73.9857),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )

    

    
    var body: some View {
        ZStack {
            Map(position: $cameraPosition) {  // ✅ Correct syntax
                Annotation("Mach Five", coordinate: CLLocationCoordinate2D(latitude: 40.7484, longitude: -73.9857)) {
                     myCar()
                   }
               }
               .edgesIgnoringSafeArea(.all)
            
            
            LinearGradient(gradient: Gradient(colors: [Color("DarkGray") , .clear , .clear ]), startPoint: .top, endPoint: .bottom )
                .edgesIgnoringSafeArea(.all)
                .allowsHitTesting(false)
         
            
            
            
            
            VStack {
                HStack {
                    Button {
                        gaya()
                         // Correct way to go back
                    } label: {
                        generalButton(icon: "chevron.left")
                    }
                    Spacer()
                    Button {
                      
                    } label: {
                        generalButton(icon: "speaker.wave.3.fill")
                    }
                }
                .padding()
                Spacer()
            }
            CarLocationPanel()
            
            
        
  
            
        }
        .background(Color("DarkGray"))
        .foregroundColor(.white)
        .navigationBarHidden(true)



    }
}

#Preview {
    LocationView()
}

struct CarLocationPanel: View {
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment:.leading , spacing: 12){
                Text("Location")
                    .font(.system(size: 30, weight: .semibold, design: .default))
                    .frame(maxWidth: .infinity ,alignment:.leading)
                
                customDivider()
                Label("20 W 34th St, New Yor, NY 10001", systemImage: "location.fill")
                    .font(.footnote)
                    .opacity(0.5)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Summon")
                        .font(.system(size: 25, weight: .regular, design: .default))
                        .frame(maxWidth: .infinity,alignment:.leading )
                    Text("Press and hold controls to move vehicle")
                        .font(.footnote)
                        .opacity(0.5)
                }
                
                customDivider()
                Button {
                    
                } label: {
                    Text("Go to target")
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.white.opacity(0.05))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10 , style: .continuous).stroke(Color.white.opacity(0.1), lineWidth: 0.5))
                }
                HStack{
                    Button {
                        
                    } label: {
                        Label("Forward",  systemImage: "arrow.up")
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.white.opacity(0.05))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10 , style: .continuous).stroke(Color.white.opacity(0.1), lineWidth: 0.5))
                    }
                    
                    Button {
                        
                    } label: {
                        Label("Backward",  systemImage: "arrow.down")
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.white.opacity(0.05))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10 , style: .continuous).stroke(Color.white.opacity(0.1), lineWidth: 0.5))
                    }
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity , alignment: .leading)
            .background(Color("DarkGray"))
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct myCar : View {
    var body: some View {
        VStack{
            Image(systemName: "car.fill")
                .frame(width: 32, height: 32)
                .background(Color("Red"))
                .foregroundColor(.white)
                .clipShape(Circle())
            
        }
    }
}
