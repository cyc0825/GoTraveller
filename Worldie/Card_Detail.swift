//
//  Card_Detail.swift
//  Worldie
//
//  Created by 曹越程 on 2023/1/25.
//

import SwiftUI

struct Card_Detail: View {
    @State var comments = ""
    var text = "content"
    var image = "image1"
    var userimage = "dio"
    var username = "username"
    var location = "location"
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 5){
                ScrollView{
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(text)
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
                .frame(width: UIScreen.main.bounds.width)
                .background(Color.white)
                
                HStack{
                    TextField("Comments", text: $comments)
                }
                .padding()
                .background(Color.accentColor)
            }
        }
        .navigationBarHidden(true)
    }
}

struct Card_Detail_Previews: PreviewProvider {
    static var previews: some View {
        Card_Detail()
    }
}
