//
//  PostView.swift
//  Worldie
//
//  Created by 曹越程 on 2023/3/7.
//

import SwiftUI

struct PostView: View {
    @State private var title: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    
                }label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 25))
                        .padding(10)
                }
                Spacer()
                Button{
                    
                } label: {
                    Text("POST")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal,20)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .frame(width: 400)
            Image("image1")
                .resizable()
                .frame(width: 400, height: 400)
            Spacer()
            TextField(
                "Enter your description",
                text: $title,
                axis: .vertical
            )
            .frame(width: 400, height: 50, alignment: .center)
            .textFieldStyle(OvalTextFieldStyle())
            .multilineTextAlignment(.leading)
            .lineLimit(15...15)
            
            Spacer()
            
            
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
