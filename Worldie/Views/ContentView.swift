//
//  ContentView.swift
//  Worldie
//
//  Created by 曹越程 on 2023/1/18.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State var select = 1
    @State var cards: [Card] = []
    @State var deletedCards: [Card] = []
    @State var selected = 0;
    @State private var userSwiping: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State var image: [PhotosPickerItem] = []
    @State var selectedImages: [Image] = []
    @State var isNotificationEnabled: Bool = false
    @State var distance : Int = 100
    @State var isShow : Bool = true
    
    var body: some View {
        NavigationView{
            VStack{
                if(isShow){
                    // Heading Navigation
                    HStack{
                        /*
                        Button{
                            
                        }label: {
                            Image(systemName: "calendar")
                        }
                        .foregroundColor(.black)
                        */
                        //Text("count: \(deletedCards.count)")
                        Spacer()
                        
                        /*Button{
                         select = 0
                         }label: {
                         Text("Nearby")
                         .fontWeight(select == 0 ? .bold:.regular)
                         .foregroundColor(select == 0 ? .black: .gray)
                         }*/
                        
                        Button{
                            select = 1
                        }label: {
                            Text("My Stories")
                                .fontWeight(select == 1 ? .bold:.regular)
                                .foregroundColor(select == 1 ? .black: .gray)
                        }
                        
                        /*Button{
                         select = 2
                         }label: {
                         Text("Subscribe")
                         .fontWeight(select == 2 ? .bold:.regular)
                         .foregroundColor(select == 2 ? .black: .gray)
                         }*/
                        
                        Spacer()
                        /*
                        Button{
                            
                        }label: {
                            Image(systemName: "magnifyingglass")
                        }
                        .foregroundColor(.black)
                        */
                    }
                    .padding()
                }
                
                // Main content
                TabView(selection:$selected){
                    
                    //NearbyView()
                    //.tag(0)
                    
                    DiscoverView(cards: $cards, isShow: $isShow, deletedCards: $deletedCards)
                    .tag(0)
                    
                    SubView(deletedCards: $deletedCards, cards: $cards)
                    .tag(1)
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                if(isShow){
                    HStack(){
                        Spacer()
                        Button{
                            selected = 0
                        }label: {
                            Text("Story")
                                .fontWeight(selected == 0 ? .bold:.regular)
                                .foregroundColor(selected == 0 ? .black: .gray)
                        }
                        .frame(width: UIScreen.main.bounds.width/3)
                        Spacer()
                        
                        NavigationLink(destination: PostView(cards: $cards)){
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal,20)
                                .background(Color.accentColor)
                                .cornerRadius(10)
                        }
                        .navigationBarTitle("")
                        
                        
                        Spacer()
                        Button{
                            selected = 1
                        }label: {
                            Text("Trashbin")
                                .fontWeight(selected == 1 ? .bold:.regular)
                                .foregroundColor(selected == 1 ? .black: .gray)
                        }
                        .frame(width: UIScreen.main.bounds.width/3)
                        Spacer()
                        
                    }
                    .padding(8)
                    .background(Color.white)
                }
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
