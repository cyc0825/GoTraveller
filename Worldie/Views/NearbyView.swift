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
                        
                        
                        
                    } // Left side cards
                    
                    VStack{
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
