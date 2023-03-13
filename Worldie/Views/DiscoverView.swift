//
//  DiscoverView.swift
//  GoTraveller
//
//  Created by 曹越程 on 2023/1/21.
//

import SwiftUI

struct DiscoverView: View {
    @Namespace var namespace
    @State var isclick : Bool = true
    @State var isshow : Bool = false
    @State var cardDetail: Card_Detail = Card_Detail(
        isshow: Binding.constant(false),
        title: "Enjoy Delicious Food...",
        content: "1",
        images: [],
        userimage: "dio",
        username: "dio",
        location: "10m")
    @State var cardDetailID: UUID = UUID()
    @State var leftCards: [Card] = []
    @State var rightCards: [Card] = []
    
    @Binding var cards: [Card]
    
    var body: some View {
        VStack{
            if isshow {
                cardDetail
                    .matchedGeometryEffect(id: cardDetailID, in: namespace)
            }
            else {
                ZStack{
                    if(cards.isEmpty){
                        Text("Your Story Starts Here")
                            .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 2, alignment: .center)
                            .foregroundColor(Color.gray)
                    }
                    
                    ScrollView{
                        HStack(alignment:.top){
                            /*if(cards.isEmpty){
                             Text("Your Story Starts Here")
                             .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 2, alignment: .center)
                             .foregroundColor(Color.gray)
                             }*/
                            VStack{
                                spaceholder()
                                    .padding(-2)
                                ForEach(0..<cards.count, id: \.self) {i in
                                    if(i % 2 == 0){
                                        cards[i]
                                            .padding(-2)
                                            .matchedGeometryEffect(id: cards[i].id, in: namespace)
                                            .onTapGesture {
                                                withAnimation(Animation.spring(response: 0.6, dampingFraction: 0.8)) {
                                                    isshow.toggle()
                                                    cardDetail = Card_Detail(
                                                        isshow: $isshow,
                                                        title: cards[i].title,
                                                        content: cards[i].context,
                                                        images: cards[i].image,
                                                        userimage: cards[i].userimage,
                                                        username: cards[i].username,
                                                        location: cards[i].location)
                                                    cardDetailID = cards[i].id
                                                    
                                                }
                                            }
                                            .onLongPressGesture{
                                                cards.remove(at: i)
                                            }
                                    }
                                }
                                
                            } // Left side cards
                            
                            VStack{
                                spaceholder()
                                    .padding(-2)
                                ForEach(0..<cards.count, id: \.self) {i in
                                    if(i % 2 == 1){
                                        cards[i]
                                            .padding(-2)
                                            .matchedGeometryEffect(id: cards[i].id, in: namespace)
                                            .onTapGesture {
                                                withAnimation(Animation.spring(response: 0.6, dampingFraction: 0.8)) {
                                                    isshow.toggle()
                                                    cardDetail = Card_Detail(
                                                        isshow: $isshow,
                                                        title: cards[i].title,
                                                        content: cards[i].context,
                                                        images: cards[i].image,
                                                        userimage: cards[i].userimage,
                                                        username: cards[i].username,
                                                        location: cards[i].location)
                                                    cardDetailID = cards[i].id
                                                    
                                                }
                                            }
                                            .onLongPressGesture{
                                                cards.remove(at: i)
                                            }
                                    }
                                }
                            } // Right side cards
                        }
                        Spacer()
                    }
                    .background(Color.gray.opacity(0.2).matchedGeometryEffect(id: "background", in: namespace))
                }
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView(cards: Binding.constant([]))
    }
}
