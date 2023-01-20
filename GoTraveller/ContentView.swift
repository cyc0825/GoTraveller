//
//  ContentView.swift
//  GoTraveller
//
//  Created by 曹越程 on 2023/1/18.
//

import SwiftUI

struct ContentView: View {
    @State var select = 0
    var body: some View {
        NavigationView{
            VStack{
                
                ScrollView{
                    
                    Color.clear.frame(height: 90)
                    TabView(selection:$select){
                        VStack{
                            HStack(alignment:.top){
                                VStack{
                                
                                    Card(text: "context", image: "image1", userimage: "dio", username: "dio", location: "10m")
                                    
                                } // Left side cards
                                
                                VStack{
                                    Card(text: "context", image: "image2", userimage: "dio", username: "dio", location: "10m")
                                } // Right side cards
                            }
                            Spacer()
                        }
                        .tag(0)
                        
                        VStack{
                            HStack(alignment:.top){
                                VStack{
                                
                                    Card(text: "context", image: "image1", userimage: "dio", username: "dio", location: "10m")
                                    
                                    Card(text: "context", image: "image1", userimage: "dio", username: "dio", location: "10m")
                                    
                                } // Left side cards
                                
                                VStack{
                                    Card(text: "context", image: "image2", userimage: "dio", username: "dio", location: "10m")
                                } // Right side cards
                            }
                            Spacer()
                        }
                        .tag(1)
                        
                        VStack{
                            HStack(alignment:.top){
                                VStack{
                                    
                                    Card(text: "context", image: "image1", userimage: "dio", username: "dio", location: "10m")
                                    
                                    Card(text: "context", image: "image1", userimage: "dio", username: "dio", location: "10m")
                                    
                                } // Left side cards
                                
                                VStack{
                                    Card(text: "context", image: "image2", userimage: "dio", username: "dio", location: "10m")
                                } // Right side cards
                                
                            }
                            Spacer()
                        }
                        .tag(2)
                        
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(minHeight:UIScreen.main.bounds.height)
                }
                .ignoresSafeArea()
                Tabbar()
            }
            .background(Color.gray.opacity(0.1))
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(){
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
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        
                    }label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .foregroundColor(.black)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
