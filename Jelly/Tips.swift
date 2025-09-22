//
//  Point.swift
//  Jelly
//
//  Created by Benjamin Chung on 1/11/25.
//

//
//  Points.swift
//  ReBinify
//
//  Created by Benjamin Chung on 1/6/24.
//

import SwiftUI


struct Points: View {
    
    //@State var selectedTab: Tabs = .points
    @State private var animateGradient: Bool = false

        var body: some View {
            
            ZStack {
                    // Background gradient
                    LinearGradient(colors: [.yellow, .white],
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
                    Text("Dermatology Tips") //title
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
                                .frame(width: 350, height: 600, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white.opacity(0.4))
                                .cornerRadius(30)
                                .overlay(
                                       RoundedRectangle(cornerRadius: 30) // Match the corner radius
                                           .stroke(Color.black, lineWidth: 2) // Set the border color and thickness
                                   )
                            VStack {
                                Text("Tip 1: Practice Sun Protection Every Single Day. Even if it's a cloudy day and you don't plan to go outside, put on SPF!") //step 1
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 20, weight: .medium, design: .default))
                                    .frame(width:320, height: 100, alignment: .leading)
                                
                                Text("Tip 2: Get Plenty of Sleep. Did you know that your skin makes new collagen while you sleep? It provides structure, support & strength to your skin, muscles, bones and connective tissues.") //step 1
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 20, weight: .medium, design: .default))
                                    .frame(width:320, height: 150, alignment: .leading)
                                
                                Text("Tip 3: We recommend that you see a dermatologist once a year, or more often if you are at a higher risk of skin cancer, for a full-body, professional skin exam.") //step 1
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 20, weight: .medium, design: .default))
                                    .frame(width:320, height: 120, alignment: .leading)
                                
                                Text("Tip 4: Skin specialists emphasize the need for hydration. A lack of sufficient water reflects negatively on the skin.") //step 1
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 20, weight: .medium, design: .default))
                                    .frame(width:320, height: 120, alignment: .leading)
                                /*
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
                                 */
                                    
                            }
                        }
                        .padding(.bottom, 20)
                        
                        /*
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
                         */
                    }
                    
                    Spacer()
                    
                    //CustomTabBar(selectedTab: $selectedTab)
                    
                }
                
            }
            
    }
}

#Preview {
    Points()
}
