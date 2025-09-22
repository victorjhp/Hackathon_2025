//
//  HowItWorks.swift
//  Jelly
//
//  Created by Benjamin Chung on 1/11/25.
//

import SwiftUI

struct HowItWorks: View {
    
    //Name of the tab
    //@State var selectedTab: Tabs = .guide
    @State private var animateGradient: Bool = false

    
    var body: some View {
            
            ZStack {
                LinearGradient(colors: [.pp, .white],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

                /*
                LinearGradient(colors: [.green, .white],
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
                */
                VStack {
                    Text("Guide") //title
                        .multilineTextAlignment(.center)
                        .font(.system(size: 40, weight: .medium, design: .default))
                        .frame(width: 400, height: 100)
                      //  .padding(.leading, 0)
                      //  .padding(.trailing, 84)
                    /*
                    Text("DermaScan") //title
                        //.multilineTextAlignment(.leading)
                        .font(.system(size: 40, weight: .medium, design: .default))
                        .frame(width: 250, height: 5)
                        //.padding(.leading, 20)
                        .padding(.trailing, 124)
                        .padding(.bottom, 40)
                    */
                    
                    VStack {
                        ZStack {
                            Rectangle() //Step 1 frame
                                .frame(width: 350, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white.opacity(0.4))
                                .cornerRadius(30)
                                .overlay(
                                       RoundedRectangle(cornerRadius: 30) // Match the corner radius
                                           .stroke(Color.black, lineWidth: 2) // Set the border color and thickness
                                   )
                            VStack {
                                Text("Scan It") //step 1
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 30, weight: .medium, design: .default))
                                Image("selfie")
                                    .renderingMode(.original)
                                    .resizable()
                                    .foregroundColor(.blue)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Text("Take a Clear Picture")
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 20, weight: .medium, design: .default))
                                    .foregroundStyle(Color.orange)
                            }
                        }
                        .padding(.bottom, 20)
                        
                        ZStack {
                            
                            Rectangle() //Step 2 frame
                                .frame(width: 350, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white.opacity(0.4))
                                .cornerRadius(30)
                                .overlay(
                                       RoundedRectangle(cornerRadius: 30) // Match the corner radius
                                           .stroke(Color.black, lineWidth: 2) // Set the border color and thickness
                                   )
                            VStack {
                                
                                
                                Text("Identify It") // step 2
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 30, weight: .medium, design: .default))
                                    
                                Image("mag")
                                    .renderingMode(.original)
                                    .resizable()
                                    .foregroundColor(.green)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70, height: 70, alignment: .center)
                                   // .padding(.bottom, 5)
                                Text("Understand Your Skin")
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 20, weight: .medium, design: .default))
                                    .foregroundStyle(Color.rblue)
                                
                            }
                        }
                        .padding(.bottom, 20)
                        
                        ZStack {
 
                            Rectangle() //Step 3 frame
                                .frame(width: 350, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white.opacity(0.4))
                                .cornerRadius(30)
                                .overlay(
                                       RoundedRectangle(cornerRadius: 30) // Match the corner radius
                                           .stroke(Color.black, lineWidth: 2) // Set the border color and thickness
                                   )
                            

                            VStack {
                                Text("Heal It") // step 3
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 30, weight: .medium, design: .default))
                                Image("bad")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70, height: 70, alignment: .center)
                                    .foregroundColor(.brown)
                                Text("Ask Your AI Assistant")
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 20, weight: .medium, design: .default))
                                    .foregroundStyle(Color.brown)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    //CustomTabBar(selectedTab: $selectedTab)
                    
                }
                
            }
    }
}

#Preview {
    HowItWorks()
}
