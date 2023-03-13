//
//  Card.swift
//  GoTraveller
//
//  Created by 曹越程 on 2023/1/18.
//

import SwiftUI

struct Card: View {
    // @Binding var UIimage: UIImage?
    var id = UUID()
    var title = ""
    var context = "1"
    var image: [Image] = []
    var userimage = "dio"
    var username = "You"
    var location = "0 m"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            // Album cover
            if(image.isEmpty){
            }
            else{
                image.first!
                    .resizable()
                    .scaledToFit()
                    .clipped()
            }
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
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}
