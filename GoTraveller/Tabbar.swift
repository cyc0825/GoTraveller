//
//  Tabbar.swift
//  GoTraveller
//
//  Created by 曹越程 on 2023/1/19.
//

import SwiftUI

struct Tabbar: View {
    @State var selected = 0;
    var body: some View {
        HStack(){
            Spacer()
            Button{
                selected = 0
            }label: {
                Text("Home")
                    .fontWeight(selected == 0 ? .bold:.regular)
                    .foregroundColor(selected == 0 ? .black: .gray)
            }
            Spacer()
            
            Button{
                
            }label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal,20)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
            Spacer()
            
            Button{
                selected = 1
            }label: {
                Text("Account")
                    .fontWeight(selected == 1 ? .bold:.regular)
                    .foregroundColor(selected == 1 ? .black: .gray)
            }
            Spacer()
            
        }
        .padding(8)
        .background(Color.white)
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
