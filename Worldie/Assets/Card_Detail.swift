//
//  Card_Detail.swift
//  Worldie
//
//  Created by 曹越程 on 2023/1/25.
//

import SwiftUI

struct Card_Detail: View {
    @Namespace var namespace
    @Binding var card: Card
    @Binding var cards: [Card]
    @State var index: Int = 0
    // @State var comments = ""
    // @State var dragvalues : CGFloat = 0
    @Binding var isshow: Bool
    @Binding var isShow: Bool
    var body: some View {
            VStack(alignment: .leading, spacing: 5){
                HStack(spacing:3){
                    Button{
                        withAnimation {
                            isshow.toggle()
                            isShow.toggle()
                        }
                    }label:{
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 25))
                            .padding(10)
                    }
                    .foregroundColor(.black)
                    
                    Spacer()
                    HStack{
                        Image(systemName: "location")
                        Text(card.location)
                            .padding(5)
                    }.frame(width: UIScreen.main.bounds.width / 4)
                }
                .font(.system(size: 18))
                ScrollView{
                    
                    NavigationLink(destination: EditView(card: $card, cards: $cards)){
                        if(card.image.isEmpty){
                            Image("image1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        else{
                            TabView {
                                ForEach(0..<card.image.count, id: \.self) { i in
                                    card.image[i]
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                            .tabViewStyle(PageTabViewStyle())
                            .frame(height: 400)
                            
                        }
                    }
                    Text(card.title)
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                    Text(card.context)
                        .padding(.horizontal, 15)
                        .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                }
                .frame(width: UIScreen.main.bounds.width)
                .background(Color.white)

                // .background(Color.accentColor)
            }
            .background(Color.clear.matchedGeometryEffect(id: "background", in: namespace))
        }
}

struct Card_Detail_Previews: PreviewProvider {
    static var previews: some View {
        Card_Detail(card: Binding.constant(Card()), cards: Binding.constant([]), isshow: Binding.constant(false), isShow: Binding.constant(true))
    }
}
