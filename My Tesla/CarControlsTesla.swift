//
//  CarControlsTesla.swift
//  My Tesla
//
//  Created by vipin on 21/03/25.
//

import SwiftUI

struct CarControlsTesla: View {
    
    @Environment(\.presentationMode) var controlScreen
  
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                VStack(alignment: .leading , spacing: 20){
                    HStack{
                        Button {
                            controlScreen.wrappedValue.dismiss()
                        } label: {
                            generalButton(icon : "chevron.left")
                        }

                        
                        Spacer()
                    }
                    Text("Car Controls")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                }
             
                customDivider()
                Button {
                    
                } label: {
                    carLockButton()
                }
                customDivider()
                moreSettings()
                customDivider()
                toggleBar()
               
                
            }
            .padding()
          
          
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("DarkGray"))
        .foregroundColor(.white)
        .navigationBarHidden(true)
      
        
    }
}

#Preview {
    CarControlsTesla()
}



struct carLockButton: View {
    var body: some View {
        Label("Unlock Car", systemImage: "lock.fill")
            .font(.system(size: 16, weight: .medium, design: .default))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 14 , style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 14 , style: .continuous).stroke(Color.white.opacity(0.1), lineWidth: 0.5))
    }
}


struct moreSettings: View {
    var body: some View {
        VStack(spacing: 20){
            
            HStack{
                Spacer()
                actionButton(icon:"flashlight.on.fill" , text:"Flashlight" )
                Spacer()
                actionButton(icon:"speaker.wave.3.fill" , text:"Honk" )
                Spacer()
                actionButton(icon:"key.fill" , text:"Start" )
                Spacer()
            }
            
            
            HStack{
                Spacer()
                actionButton(icon:"arrow.up.bin" , text:"Front Trunk" )
                Spacer()
                actionButton(icon:"arrow.up.square",text:"Trunk" )
                Spacer()
            }
            
        }
    }
}


struct toggleBar: View {
    @State var light : Bool = false
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Text("Valet Mode")
                    .font(.system(size: 20, weight: .medium, design: .default))
                Spacer()
                Toggle("", isOn: $light)
            }
            if(light){
                Text("Valet mode is on")
                    .font(.system(size: 17, weight: .medium, design: .default))
            }
            else{
                Text("Valet mode is off")
                    .font(.system(size: 17, weight: .medium, design: .default))
            }
        }
    }
}
 
