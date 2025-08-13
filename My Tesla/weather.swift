//
//  weather.swift
//  My Tesla
//
//  Created by vipin on 25/03/25.
//
//
//  music.swift
//  My Tesla
//
//  Created by vipin on 25/03/25.
//

import SwiftUI

struct weather: View {
    @Environment(\.presentationMode) var controlScreen
    var body: some View {
            VStack(spacing: 20){
                HStack{
                    Button {
                        controlScreen.wrappedValue.dismiss()
                    } label: {
                        generalButton(icon : "chevron.left")
                    }
                    
                    Spacer()
                }
                
                customDivider()
                
                Image("weather")
                    .resizable()
                    .frame(width: 300,height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .center , spacing: 20) {
                        Text("26°")
                        .font(.system(size: 60, weight: .bold))
                    HStack(spacing: 20) {
                        Label("34°", systemImage: "arrowshape.up.fill")
                            .font(.system(size: 25, weight: .bold))
                        
                        Label("25°", systemImage: "arrowshape.down.fill" )
                            .font(.system(size: 25, weight: .bold))
                    }
                        Text("Mostly Cloudy")
                        .font(.system(size: 20, weight: .bold))
                            .opacity(0.5)
                }
            
              
                
                
               
                
                
                
             
        
                
                Spacer()
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("DarkGray"))
            .foregroundColor(.white)
            .navigationBarHidden(true)
            
        
    
    }
}

#Preview {
   weather()
}
