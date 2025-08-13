//
//  music.swift
//  My Tesla
//
//  Created by vipin on 25/03/25.
//

import SwiftUI

struct music: View {
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
                
                Image("DuaLipa")
                    .resizable()
                    .frame(width: 350,height: 350)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                HStack(alignment: .center , spacing: 20) {
                    Image("spotify")
                        .resizable()
                        .frame(width: 70,height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Dance the night")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Dua Lipa")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .opacity(0.5)
                    }
                    Spacer()
                }
                .padding(.horizontal , 10)
                
                
                VStack(spacing: 10){
                    HStack{
                        Text("1:05")
                        Spacer()
                        Text("-2:30")
                    }
                    .font(.system(size: 14 , weight: .medium , design: .monospaced))
                    .opacity(0.5)
                    ZStack(alignment: .leading){
                        Color.white.opacity(0.25)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color("Green")
                            .frame(width: 200)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color.white
                            .frame(width: 16,height: 16)
                            .clipShape(Circle())
                            .offset(x: 192)
                    }
                }
                .padding(.horizontal , 10)
                
                
                
                HStack{
                    HStack(alignment: .center, spacing: 20){
                        Button {
                            
                        } label: {
                            Image(systemName: "backward.fill")
                                .font(.system(size: 20 ,weight : .semibold , design: .default))
                                .opacity(0.5)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "playpause.fill")
                                .font(.system(size: 20 ,weight : .semibold , design: .default))
                        }

                        Button {
                            
                        } label: {
                            Image(systemName: "forward.fill")
                                .font(.system(size: 20 ,weight : .semibold , design: .default))
                                .opacity(0.5)
                        }


                    }
                    Spacer()
                    HStack(alignment: .center, spacing: 20){
                        Button {
                            
                        } label: {
                            Image(systemName: "minus")
                                .font(.system(size: 20 ,weight : .semibold , design: .default))
                                .opacity(0.5)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "speaker.wave.3.fill")
                                .font(.system(size: 20 ,weight : .semibold , design: .default))
                        }

                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 20 ,weight : .semibold , design: .default))
                                .opacity(0.5)
                        }


                    }

                }
                .padding(.horizontal,10)
                
                
                
                
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
    music()
}

        

