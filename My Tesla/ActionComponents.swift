//
//  ActionComponents.swift
//  My Tesla
//
//  Created by vipin on 24/03/25.
//

import SwiftUI

struct ActionComponents: View {
    
    @State var icon : String
    @State var text : String
    @Binding var openAction : Bool
    
    var body: some View {
        actionNotification(openAction : $openAction, icon: $icon, text: $text)
    }
}

#Preview {
    
//    ActionComponents()
 

}



struct actionNotification: View {
    
    @Binding var openAction : Bool
    @Binding var icon : String
    @Binding var text : String
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .center , spacing: 10){
                Image(systemName: icon)
                Text(text)
                    .fontWeight(.medium)
                Spacer()
                Button {
                    withAnimation {
                        openAction = false
                    }
                   
                } label: {
                    Text("Cancel")
                        .font(.headline)
                        .opacity(0.5)
                }
                
            }
            .padding(20)
            .background(Color("DarkGray"))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .padding()
        }
        .edgesIgnoringSafeArea(.bottom)
     
    
    
    }
    
}

struct chargingView : View {
    @State var showAlert = false
    @Binding var stopCharging : Bool
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment: .leading,spacing: 30) {
            
                VStack(alignment: .leading, spacing: 10) {
                    Label("864 Miles" , systemImage: "bolt.fill")
                        .font(.system(size: 24 , weight: .semibold , design: .rounded))
                        .foregroundColor(Color("Green"))
                    Text("3h 55m - 32/3A - 30 mi/hour")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
           
                VStack( alignment: .leading, spacing: 10){
                    Text("Charge Limit: 1025 miles")
                        .font(.footnote)
                        .fontWeight(.medium)
                    .opacity(0.5)
                    ZStack(alignment: .leading){
                        Color.white.opacity(0.25)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color("Green")
                            .frame(width: 290)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color.white
                            .frame(width: 16,height: 16)
                            .clipShape(Circle())
                            .offset(x: 290)
                    }
                }
                 
                customDivider()
                    .alert(isPresented: $showAlert){
                    Alert(
                        title: Text("Stop Charging ?"),
                        message: Text("Your car is not fully charged yet"),
                        primaryButton: .cancel(), // Default cancel button
                        secondaryButton: .destructive(Text("Stop")) { // Action on stop
                            withAnimation {
                                stopCharging = false
                            }
                        }
                    )
                }

                Button {
                    showAlert = true
                } label: {
                    Text("Stop Charging")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .padding(.vertical , 10)
                        .padding(.horizontal , 16)
                        .background(Color("Red"))
                        .clipShape(Capsule())
                }
                .frame(maxWidth:.infinity)

            }
            .padding(.bottom,20)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("DarkGray"))
            .foregroundStyle(.white)
            .cornerRadius(16)
        }
        .edgesIgnoringSafeArea(.all)
  
    }
}

