//
//  ContentView.swift
//  Worldie
//
//  Created by 曹越程 on 2023/1/18.
//

import SwiftUI

struct ContentView: View {
    @State var select = 1
    var body: some View {
        NavigationView{
            VStack{
                
                HStack{
                    
                    Button{
                        
                    }label: {
                        Image(systemName: "message")
                    }
                    .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button{
                        select = 0
                    }label: {
                        Text("Nearby")
                            .fontWeight(select == 0 ? .bold:.regular)
                            .foregroundColor(select == 0 ? .black: .gray)
                    }
                    
                    Button{
                        select = 1
                    }label: {
                        Text("Discover")
                            .fontWeight(select == 1 ? .bold:.regular)
                            .foregroundColor(select == 1 ? .black: .gray)
                    }
                    
                    Button{
                        select = 2
                    }label: {
                        Text("Subscribe")
                            .fontWeight(select == 2 ? .bold:.regular)
                            .foregroundColor(select == 2 ? .black: .gray)
                    }
                    
                    Spacer()
                    
                    Button{
                        
                    }label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .foregroundColor(.black)
                    
                }
                .padding()
                
                    
                TabView(selection:$select){
                    
                    NearbyView()
                    .tag(0)
                    
                    DiscoverView()
                    .tag(1)
                    
                    SubView()
                    .tag(2)
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                Tabbar()
            }
            .navigationBarHidden(true)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
