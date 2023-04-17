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
        card: Binding.constant(Card()),
        cards: Binding.constant([]),
        index: 0,
        isshow: Binding.constant(false),
        isShow: Binding.constant(false))
    @State var cardDetailID: UUID = UUID()
    @State var leftCards: [Card] = []
    @State var rightCards: [Card] = []
    @State var card = Card()
    @Binding var cards: [Card]
    @Binding var isShow: Bool
    @Binding var deletedCards: [Card]
    
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
                                                    isShow.toggle()
                                                    card = cards[i]
                                                    cardDetailID = card.id
                                                    cardDetail = Card_Detail(
                                                        card: $card,
                                                        cards: $cards,
                                                        index: i,
                                                        isshow: $isshow,
                                                        isShow: $isShow)
                                                    
                                                }
                                            }
                                            .onLongPressGesture{
                                                withAnimation(Animation.linear(duration: 0.5)){
                                                    deletedCards.append(card)
                                                    cards.remove(at: i)
                                                }
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
                                                    isShow.toggle()
                                                    card = cards[i];
                                                    cardDetailID = card.id
                                                    cardDetail = Card_Detail(
                                                        card: $card,
                                                        cards: $cards,
                                                        index: i,
                                                        isshow: $isshow,
                                                        isShow: $isShow)
                                                    
                                                }
                                            }
                                            .onLongPressGesture{
                                                withAnimation(Animation.linear(duration: 0.5)){
                                                    deletedCards.append(card)
                                                    cards.remove(at: i)
                                                }
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
        DiscoverView(cards: Binding.constant([]), isShow: Binding.constant(true), deletedCards: Binding.constant([]))
    }
}
