//
//  RealTab.swift
//  Jelly
//
//  Created by Benjamin Chung on 1/11/25.
//

//
//  RealTab.swift
//  ReBinify
//
//  Created by Benjamin Chung on 1/20/24.
//

import SwiftUI


struct RealTab: View {
    var body: some View {
        TabView {
            HowItWorks()
                .tabItem {
                    Image(systemName: "text.book.closed")
                    Text("Guide")
                }

            // Other tabs go here
            CamLink()
                .tabItem {
                    Image(systemName: "camera.viewfinder")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text("Scanner")
                }
            
            
            Learn()
                .tabItem {
                    Image(systemName: "calendar.circle")
                        .foregroundColor(.blue)
                    Text("Tracker")
                }
            
            
            Points()
                .tabItem {
                    Image(systemName: "lightbulb.circle")
                    Text("Tips")
                }
        }
    }
}

// HowItWorks.swift remains the same but without the TabView part


#Preview {
    RealTab()
}
