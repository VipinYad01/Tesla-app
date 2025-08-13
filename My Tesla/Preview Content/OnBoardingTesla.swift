import SwiftUI

struct OnBoardingTesla: View {
    @State var showContentView = false // Track if onboarding is done

    var body: some View {
        ZStack {
            if showContentView {
                ContentView() // Show ContentView when onboarding is done
                    .transition(.move(edge: .trailing)) // Smooth transition
            } else {
                // Onboarding Screen
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)

                    VStack {
                        Image("TeslaLogo")
                            .resizable()
                            .frame(width: 300, height: 300)

                        Text("Charge faster, drive smarter")
                            .foregroundColor(Color.white)
                            .font(.system(size: 25, weight: .bold))

                        Spacer()
                            .frame(height: 200)

                        Button {
                            withAnimation {
                                showContentView = true // Move to next screen
                            }
                        } label: {
                            HStack {
                                Text("Get Started")
                                    .font(.system(size: 22, weight: .bold))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .padding(.horizontal)
                            .frame(width: 270, height: 60)
                            .background(Color.white)
                            .cornerRadius(10)
                            .foregroundColor(Color.black)
                        }
                    }
                }
                .transition(.move(edge: .leading)) // Smooth exit transition
            }
        }
    }
}

#Preview {
    OnBoardingTesla()
}
