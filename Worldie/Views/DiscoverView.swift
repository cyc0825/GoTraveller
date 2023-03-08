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
    var body: some View {
        VStack{
            if isshow {
                Card_Detail(
                    isshow: $isshow,
                    title: "Enjoy Delicious Food...",
                    content: "The answer is easy. Food is universal. Everybody has to eat! It’s as simple as that. So people want to find tasty, healthy food, the best places to eat, etc. It’s no wonder that everybody’s talking about food. \n\n In fact, The Daily Meal even claims that just talking about food might make you healthier. What do you think? \n\n In The Huffington Post, award-winning chef Marcus Samuelsson talks about how food cuts across cultures. Every culture in every country has its own cuisine (style of cooking) and this is what makes travel so fascinating. \n\n You not only get to enjoy the sights and sounds, but you also know there are always new and exciting food adventures waiting for you.",
                    image: "image1",
                    userimage: "dio",
                    username: "dio",
                    location: "10m")
                    .matchedGeometryEffect(id: "card", in: namespace)
            }
            else {
                ScrollView{
                    HStack(alignment:.top){
                        VStack{
                            VStack{
                                Card(text: "Enjoy Delicious Food...",
                                     image: "image1",
                                     userimage: "dio",
                                     username: "dio",
                                     location: "10m").padding(-2)
                                    .matchedGeometryEffect(id: "card", in: namespace)
                            }
                            .onTapGesture {
                                withAnimation(Animation.spring(response: 0.6, dampingFraction: 0.8)) {
                                    isshow.toggle()
                                }
                            }
                        
                            Card(text: "Lonely M...", image: "image3", userimage: "dio", username: "dio", location: "10m").padding(-2)
                            
                            Card(text: "Nice Cloud...", image: "image5", userimage: "dio", username: "dio", location: "10m").padding(-2)
                            
                            
                            
                        } // Left side cards
                        
                        VStack{
                            Card(text: "High building", image: "image2", userimage: "dio", username: "dio", location: "10m").padding(-2)
                            
                            Card(text: "Love this place", image: "image4", userimage: "dio", username: "dio", location: "10m").padding(-2)
                            
                            Card(text: "Want to do some snowboarding...", image: "image6", userimage: "dio", username: "dio", location: "10m").padding(-2)
                        } // Right side cards
                    }
                    Spacer()
                }
                .background(Color.gray.opacity(0.2).matchedGeometryEffect(id: "background", in: namespace))
            }
        }
        
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
