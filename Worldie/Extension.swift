//
//  Extension.swift
//  Worldie
//
//  Created by 曹越程 on 2023/1/21.
//

import SwiftUI
import PhotosUI

extension Image{
    func toCircle(radius:CGFloat) -> some View{
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .mask(Circle())
            .frame(width: radius)
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 5)
    }
}
