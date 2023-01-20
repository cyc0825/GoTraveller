//
//  Card.swift
//  GoTraveller
//
//  Created by 曹越程 on 2023/1/18.
//

import SwiftUI

struct Card: View {
    var text = "content"
    var image = "image1"
    var userimage = "dio"
    var username = "username"
    var location = "location"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("content")
            
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
        }
        .frame(width: UIScreen.main.bounds.width * 4 / 9)
        .padding(10)
        .background(Color.white)
        .cornerRadius(8)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}
