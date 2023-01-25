//
//  NearbyView.swift
//  Worldie
//
//  Created by 曹越程 on 2023/1/21.
//

import SwiftUI

struct NearbyView: View {
    var Images: [User] = [
        User(name: "dio", idle: "dio"),
        User(name: "susan", idle: "image5")]
    var body: some View {
        ScrollView{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Spacer()
                    ForEach(Images){item in
                        VStack(spacing:0){
                            Image(item.idle)
                                .toCircle(radius: 80)
                            Text(item.name)
                        }
                    }
                    Spacer()
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            VStack{
                HStack(alignment:.top){
                    VStack{
                    
                        Card(text: "Enjoy Delicious Food...", image: "image1", userimage: "dio", username: "dio", location: "10m").padding(-2)
                        
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
        }
        
        .ignoresSafeArea()
        .background(Color.gray.opacity(0.1))
    }
}

struct NearbyView_Previews: PreviewProvider {
    static var previews: some View {
        NearbyView()
    }
}
