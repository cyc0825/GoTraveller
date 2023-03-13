//
//  Card_Detail.swift
//  Worldie
//
//  Created by 曹越程 on 2023/1/25.
//

import SwiftUI

struct Card_Detail: View {
    @Namespace var namespace
    @State var comments = ""
    @State var dragvalues : CGFloat = 0
    @Binding var isshow: Bool
    var title = "How do I comment on this food "
    var content = "The answer is easy. Food is universal. Everybody has to eat! It’s as simple as that. So people want to find tasty, healthy food, the best places to eat, etc. It’s no wonder that everybody’s talking about food. \n\n In fact, The Daily Meal even claims that just talking about food might make you healthier. What do you think? \n\n In The Huffington Post, award-winning chef Marcus Samuelsson talks about how food cuts across cultures. Every culture in every country has its own cuisine (style of cooking) and this is what makes travel so fascinating. \n\n You not only get to enjoy the sights and sounds, but you also know there are always new and exciting food adventures waiting for you."
    var images: [Image] = []
    var userimage = "dio"
    var username = "username"
    var location = "location"
    var body: some View {
            VStack(alignment: .leading, spacing: 5){
                HStack(spacing:3){
                    Button{
                        withAnimation {
                            isshow.toggle()
                        }
                    }label:{
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 25))
                            .padding(10)
                    }
                    .foregroundColor(.black)
                    Image(userimage).toCircle(radius: 50)
                    
                    Text(username)
                    
                    Spacer()
                    
                    Image(systemName: "location")
                    Text(location)
                        .padding(10)
                }
                .font(.system(size: 18))
                ScrollView{
                    if(images.isEmpty){
                        Image("image1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    else{
                        TabView {
                            ForEach(0..<images.count, id: \.self) { i in
                                images[i]
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .frame(height: 400)
                        
                    }
                    Text(title)
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                    Text(content)
                        .padding(.horizontal, 15)
                        .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                }
                .frame(width: UIScreen.main.bounds.width)
                .background(Color.white)
                
                HStack(spacing: 20){
                    
                    TextField("Comments", text: $comments)
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                    Image(systemName: "checkmark.square")
                    Image(systemName: "star")
                    Image(systemName: "paperplane")
                }
                .font(.system(size: 18))
                .padding()
                // .background(Color.accentColor)
            }
            .background(Color.clear.matchedGeometryEffect(id: "background", in: namespace))
        }
}

struct Card_Detail_Previews: PreviewProvider {
    static var previews: some View {
        Card_Detail(isshow: Binding.constant(false))
    }
}
