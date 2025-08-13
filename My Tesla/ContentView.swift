//
//  ContentView.swift
//  My Tesla
//
//  Created by vipin on 19/03/25.
//

import SwiftUI

struct ContentView: View {

    var actionButtons1: [quickShourcuts] = [
        quickShourcuts(icon: "bolt.fill", text: "Charging"),
        quickShourcuts(icon: "fanblades.fill", text: "Fan On"),
        quickShourcuts(icon: "playpause.fill", text: "Media Controls"),
        quickShourcuts(icon: "bolt.car", text: "Close Charge Port"),
        quickShourcuts(icon: "car.side.rear.open.fill", text: "Open Rear Door"),
        quickShourcuts(icon: "figure.seated.side.left.air.distribution.middle.and.lower", text: "Air Controls"),
        quickShourcuts(icon: "thermometer.and.liquid.waves", text: "Temperature"),
        quickShourcuts(icon: "steeringwheel.and.lock", text: "Steering Lock"),
        quickShourcuts(icon: "wifi", text: "Wi-Fi"),
        quickShourcuts(icon: "teletype.answer", text: "Call"),
        quickShourcuts(icon: "speaker.wave.3.fill", text: "Volume")
    ]
    
    var actionButtons2: [quickShourcuts] = [
        quickShourcuts(icon: "arrow.up.square", text: "Open Trunk"),
        quickShourcuts(icon: "fanblades", text: "Fan Off"),
        quickShourcuts(icon: "person.fill.viewfinder", text: "Summon"),
    
    ]
    

    @State var openCharging = false
    @State var openVoiceCommand = false
    
    @State var actionText : String = ""
    @State var actionicon : String = ""
    @State var openAction : Bool = false
    
    @State var showContentView = false
    
    var body: some View {
        
        if showContentView {
            OnBoardingTesla()// Show ContentView when onboarding is done
                .transition(.move(edge: .leading)) // Smooth transition
        } else {
            
            NavigationView{
                ZStack{
                    ScrollView{
                        VStack(spacing: 20){
                            homeHeader()
                            customDivider()
                            carSection(openCharging: $openCharging)
                            customDivider()
                            categoryView( title: "Quick Shortcuts" , showEdits: true, actionButtonMain: actionButtons1)
                            customDivider()
                            categoryView(title: "Recent Actions" , actionButtonMain: actionButtons2)
                            customDivider()
                            allSettings()
                            reorderGroup(showContent: $showContentView)
                            
                        }
                        .padding()
                        
                    }
                    
                    voiceCommandButton(openVoiceCommand: $openVoiceCommand)
                    
                    if(openCharging || openVoiceCommand ){
                        Color.black.opacity(0.5)
                            .edgesIgnoringSafeArea(.all)
                            .transition(.opacity)
                            .onTapGesture {
                                withAnimation {
                                    openCharging = false
                                    openVoiceCommand = false
                                    openAction = false
                                }
                                
                            }
                    }
                    
                    
                    if(openCharging){
                        chargingView(stopCharging: $openCharging)
                            .zIndex(1)
                            .transition(.move(edge: .bottom))
                    }
                    
                    if(openVoiceCommand){
                        ActionComponents(icon: "mic.fill", text: "Listening..." , openAction : $openVoiceCommand)
                            .zIndex(1)
                            .transition(.move(edge: .bottom))
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("DarkGray"))
                .foregroundColor(.white)
                .navigationTitle("Mach Five")
                .navigationBarHidden(true)
                
                
            }
        }
    }
}

#Preview {
    ContentView()
}


struct voiceCommandButton : View {
    @Binding var openVoiceCommand : Bool
    var body: some View {
        VStack{
            Spacer()
            
            HStack{
                Spacer()
                Button {
                    withAnimation {
                        openVoiceCommand = true
                    }
                   
                } label: {
                    Image(systemName: "mic.fill")
                        .font(.system(size: 24, weight: .semibold , design: .default))
                        .frame(width: 64, height: 64)
                        .background(Color("Green"))
                        .foregroundColor(Color("DarkGray"))
                        .clipShape(.circle)
                        .padding()
                        .shadow(radius: 10)

                }

            }
        }
        .edgesIgnoringSafeArea(.all)
       
    }
}


struct homeHeader: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading , spacing: 10){
                Text("Model 3".uppercased())
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.vertical , 5)
                    .padding(.horizontal , 10)
                    .foregroundColor(.white)
                    .background(Color("Red"))
                    .clipShape(Capsule())
                    
                Text("Mach Five")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            Spacer()
            HStack{
                    Button {
                    
                    } label: {
                        generalButton(icon: "lock.fill")
                    }
                Button {
                    
                } label: {
                    generalButton(icon: "gear")
                }
            
               
                
            }
            
        }
        .padding(.top)
    }
}


struct generalButton: View {
    var icon : String
    var body: some View {
        
        Image(systemName: icon)
            .imageScale(.large)
            .frame(width: 44, height: 44)
            .background(Color.white.opacity(0.05))
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(Color.white.opacity(0.1), lineWidth: 0.5 )
            }
    }
}


struct customDivider: View {
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 0.35)
            .background(Color.gray)
            .opacity(0.1)
    }
}


struct carSection: View {
    @Binding var openCharging : Bool
    var body: some View {
        VStack(spacing: 20){
            HStack(alignment: .center){
                Button {
                   withAnimation {
                        openCharging = true
                   }
                  
                } label: {
                    Label("864 MILES", systemImage: "battery.75")
                    .font(.system(size: 14 , weight: .semibold , design: .rounded))
                    .foregroundColor(Color("Green"))
                }

           
                Spacer()
                VStack(alignment: .trailing){
                    Text("Parked")
                        .fontWeight(.semibold)
                    Text("Last updated : 6 min ago")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                
            }
            Image("tesla1")
                .resizable()
                .frame(width: 350, height: 165)
              

              
               
            
        }
    }
}


struct quickShourcuts : Identifiable {
    let id = UUID()
    let icon: String
    let text: String
}


struct categoryView: View {
    var title : String
    var showEdits : Bool = false
    var actionButtonMain : [quickShourcuts]
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                if (showEdits){
                    Button {
                        
                    } label: {
                        Text("Edit")
                            .foregroundColor(.gray)
                            .fontWeight(.medium)
                    }
                }
            

            }
            ScrollView(.horizontal , showsIndicators: false){
                HStack(alignment: .top){
                    ForEach(actionButtonMain) { shortcut in
                        actionButton(icon: shortcut.icon, text: shortcut.text)
                    }

                  
                }
             
            }
        }
       
    }
}


struct actionButton : View {
    var icon : String
    var text : String
    var body: some View {
        VStack(alignment: .center){
            Button {
             
            } label: {
                generalButton(icon : icon)
            
            }
            Text(text)
                .font(.system(size: 12 , weight: .semibold, design: .default))
                .frame(width: 80)
                .multilineTextAlignment(.center)
 
        }
    }
}


struct allSettings : View {
    
    
    var body: some View {
        VStack{
            HStack(){
                Text("All Settings")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
               
            }
            VStack(){
                LazyVGrid(columns: [GridItem(.fixed(170) , spacing: 20),GridItem(.fixed(170))] , spacing: 20) {
                    
                    
                    NavigationLink(destination: CarControlsTesla()) {
                        settingBlock(icon: "car.fill", title: "Controls" , subTitle: "CAR LOCKED")
                    }
                    
                    
                    NavigationLink(destination: weather()) {
                        settingBlock(icon: "fanblades.fill", title: "Climate" , subTitle: "INTERIOR 68° F" , backGroundColor: Color("Blue"))
                        
                    }
                    
                    NavigationLink(destination: LocationView()) {
                        settingBlock(icon: "location.fill", title: "Location" , subTitle:   "EMPIRE STATE BUILDING")
                        
                    }
                    
                
                    
                    NavigationLink(destination: security()) {
                        settingBlock(icon: "checkerboard.shield", title: "Security" , subTitle: "0 EVENTS DETECTED")
                    }
                    

                    settingBlock(icon: "sparkles", title: "Upgrades" , subTitle: "3 UPGRADES AVAILABLE")
                
                    
                    NavigationLink(destination: music()) {
                        settingBlock(icon: "music.note.list", title: "Music" , subTitle: "64 songs")
                    }
                }
            }
        }
        
       
    }
}


struct settingBlock: View {
    var icon : String
    var title : String
    var subTitle : String
    
    var backGroundColor : Color = Color.white.opacity(0.05)
    
    var body: some View {
        HStack(alignment: .center){
            Image(systemName: icon)
            VStack(alignment: .leading , spacing: 2){
                Text(title)
                    .fontWeight(.semibold)
                    .fixedSize(horizontal: true, vertical: false)
            
                   
                    
                if(!subTitle.isEmpty){
                    Text(subTitle.uppercased())
                        .font(.system(size: 8 , weight: .medium , design: .default))
                        .frame(maxWidth: .infinity , alignment : .leading)
                        .lineLimit(1)
                }
                
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .background(backGroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white.opacity(0.2), style: StrokeStyle(lineWidth: 0.5))
        }
     
     
    }
}


struct reorderGroup : View {
    @Binding var showContent : Bool
    @State var showAlert : Bool = false
    var body: some View {
        Button {
            showAlert = true
        } label: {
            Text("Log Out")
                .font(.caption)
                .fontWeight(.semibold)
                .padding(.vertical , 10)
                .padding(.horizontal , 16)
                .background(Color.white.opacity(0.05))
                .clipShape(Capsule())
        }
        .alert(isPresented: $showAlert){
        Alert(
            title: Text("Log Out ?"),
            message: Text("Go back to the home screen"),
            primaryButton: .cancel(), // Default cancel button
            secondaryButton: .destructive(Text("Yes")) { // Action on stop
                withAnimation {
                    showContent = true
                }
            }
        )
    }

     
        
    }
}

