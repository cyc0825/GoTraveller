//
//  DiscoverView.swift
//  GoTraveller
//
//  Created by 曹越程 on 2023/1/21.
//

import SwiftUI

struct DiscoverView: View {
    @State var isclick: Bool = true
    @State var showDetail: Bool = false
    
    var body: some View {
        VStack{
            ScrollView{
                if(showDetail){
                    Card(title: "Enjoy Delicious Food...",
                         image: "image1",
                         userimage: "dio",
                         username: "dio",
                         location: "10m",
                         isshow: true,
                         showDetail: $showDetail).padding(-2)
                }
                else{
                    HStack(alignment:.top){
                        VStack{
                            Card(title: "Enjoy Delicious Food...",
                                 image: "image1",
                                 userimage: "dio",
                                 username: "dio",
                                 location: "10m",
                                 showDetail: $showDetail).padding(-2)
                            
                            Card(title: "Lonely M...", image: "image3", userimage: "dio", username: "dio", location: "10m",
                                 showDetail: $showDetail).padding(-2)
                            
                            Card(title: "Nice Cloud...", image: "image5", userimage: "dio", username: "dio", location: "10m",
                                 showDetail: $showDetail).padding(-2)
                            
                            
                            
                        } // Left side cards
                        
                        VStack{
                            Card(title: "High building", image: "image2", userimage: "dio", username: "dio", location: "10m",
                                 showDetail: $showDetail).padding(-2)
                            
                            Card(title: "Love this place", image: "image4", userimage: "dio", username: "dio", location: "10m",
                                 showDetail: $showDetail).padding(-2)
                            
                            Card(title: "Want to do some snowboarding...", image: "image6", userimage: "dio", username: "dio", location: "10m",
                                 showDetail: $showDetail).padding(-2)
                        } // Right side cards
                    }
                    Spacer()
                }
            }
        }
        
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
