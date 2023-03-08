//
//  GoTravellerApp.swift
//  GoTraveller
//
//  Created by 曹越程 on 2023/1/18.
//

import SwiftUI

@main
struct WorldieApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct WorldierApp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            VStack{
            ScrollView{
                Color.clear.frame(height:90)
                TabView{
                    VStack{
                        HStack(alignment:.top){
                        }
                        Spacer()
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(minHeight:UIScreen.main.bounds.height)
            }
                
            }
            .background(Color.gray.opacity(0.2))
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(){
                        Button{
                        }label: {
                            Text("Nearby")
                        }
                        
                        Button{
                        }label: {
                            Text("Discover")
                        }
                        
                        Button{
                        }label: {
                            Text("Subscribe")
                                
                        }
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
}
