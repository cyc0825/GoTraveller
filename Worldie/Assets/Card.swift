//
//  Card.swift
//  GoTraveller
//
//  Created by 曹越程 on 2023/1/18.
//

import SwiftUI

struct Card: View {
    // @Binding var UIimage: UIImage?
    var title = "content"
    var image = "image1"
    var userimage = "dio"
    var username = "username"
    var location = "location"
    var content = "The answer is easy. Food is universal. Everybody has to eat! It’s as simple as that. So people want to find tasty, healthy food, the best places to eat, etc. It’s no wonder that everybody’s talking about food. \n\n In fact, The Daily Meal even claims that just talking about food might make you healthier. What do you think? \n\n In The Huffington Post, award-winning chef Marcus Samuelsson talks about how food cuts across cultures. Every culture in every country has its own cuisine (style of cooking) and this is what makes travel so fascinating. \n\n You not only get to enjoy the sights and sounds, but you also know there are always new and exciting food adventures waiting for you."
    @Namespace var namespace
    @State var isshow : Bool = false
    @Binding var showDetail: Bool
    
    var body: some View {
        if isshow {
            Card_Detail(isshow: $isshow,
                        showDetail: $showDetail,
                        title: title,
                        content: content,
                        image: image,
                        userimage: userimage,
                        username: username,
                        location: location)
        }
        else {
            VStack(alignment: .leading, spacing: 5){
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(title)
                    .padding(.horizontal, 3)
                
                HStack(spacing:3){
                    Image(userimage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .mask(Circle())
                        .frame(width: 30, height: 30)
                    
                    Text(username)
                    
                    Spacer()
                    
                    Image(systemName: "location")
                    Text(location)
                }
                .font(.footnote)
                .padding(3)
            }
            .frame(width: UIScreen.main.bounds.width * 49 / 100)
            .background(Color.white)
            .cornerRadius(10)
            .matchedGeometryEffect(id: "card", in: namespace)
            .onTapGesture {
                    isshow.toggle()
                    showDetail.toggle()
                
            }
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(showDetail: Binding.constant(false))
    }
}
