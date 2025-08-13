//
//  security.swift
//  My Tesla
//
//  Created by vipin on 25/03/25.
//

import SwiftUI

struct security: View {
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
            
            VStack(spacing: 40){
                
                
                Image("teslaside")
                    .resizable()
                    .frame(width: 370,height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .center , spacing: 60) {
                    Text("Enter Security Pin")
                        .font(.system(size: 35, weight: .bold))
                    HStack(spacing: 30) {
                        Rectangle()
                            .frame(width: 50, height: 5)
                            .opacity(0.6)
                        Rectangle()
                            .frame(width: 50, height: 5)
                            .opacity(0.6)
                        Rectangle()
                            .frame(width: 50, height: 5)
                            .opacity(0.6)
                        Rectangle()
                            .frame(width: 50, height: 5)
                            .opacity(0.6)

                }
                }
            }
            
            Spacer()
            
            Image(systemName: "touchid")
                .font(.system(size: 70))
        
        
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
    security()
}
