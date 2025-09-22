//
//  ContentView.swift
//  Jelly
//
//  Created by Benjamin Chung on 1/11/25.
//

//
//  ContentView.swift
//  ReBinify
//
//  Created by Benjamin Chung on 1/2/24.
//
import SwiftUI
struct ContentView: View {
    @State private var animateGradient: Bool = false
        
    var body: some View {
        //background
        NavigationView {
            ZStack {
                LinearGradient(colors: [.ppink, .tteal],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                //gradient animation
                .hueRotation(.degrees(animateGradient ? 45 : 0))
                .onAppear {
                    withAnimation(.easeInOut(duration: 3)
                        .repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                        }
                }
                VStack(spacing: 20) //space between text
                {
                    Text("Welcome to DermaScan")
                        .minimumScaleFactor(0.5)
                        .font(.system(size: 60, weight: .medium, design: .default))
                        .foregroundColor(.black)
                        .frame(width: 250, height: 150)
                        .padding(.top, 80) //top
                        .padding(.leading, 20) //left
                        .padding(.trailing, 110) //right
                    Text("Your Personal AI Powered Skin Health Assistant")
                        .font(.system(size: 24, weight: .medium, design: .default))
                        .foregroundColor(.black)
                        .frame(width: 250)
                        .padding(.leading, 20)
                        .padding(.trailing, 120)
                        //.padding(.bottom, 10)
                    VStack
                    {
                        Image("logo2")
                            .renderingMode(.original)
                            .resizable()
                            .foregroundColor(Color.green)
                            //.symbolEffect(.pulse)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250, alignment: .center)
                            //.padding(.top, 10)
                    }
                    Spacer()
                    //Button
                    NavigationLink(destination: RealTab(), label: {
                        Text("Get Started")
                            .frame(width: 300, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) //typical button frame
                            .background(Color.fgreen)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                    Spacer()
                        .navigationBarBackButtonHidden(true)
                }
            }
        } //NavigationView end bracket
        .accentColor(Color(.label))
    }
}
#Preview {
    ContentView()
}

