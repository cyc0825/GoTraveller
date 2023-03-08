//
//  SubView.swift
//  Worldie
//
//  Created by 曹越程 on 2023/1/21.
//

import SwiftUI

struct SubView: View {
    var Images: [User] = [
        User(name: "dio", idle: "dio"),
        User(name: "dio", idle: "dio"),
        User(name: "dio", idle: "dio"),
        User(name: "dio", idle: "dio"),
        User(name: "dio", idle: "dio")]
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
                HStack{
                    
                }
                Image("image1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width)
            }
        }
    }
}

struct User: Identifiable {
    let name: String
    let idle: String
    var id: String { name }
}

struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView()
    }
}
