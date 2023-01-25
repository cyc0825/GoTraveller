//
//  Extension.swift
//  Worldie
//
//  Created by 曹越程 on 2023/1/21.
//

import SwiftUI

extension Image{
    func toCircle(radius:CGFloat) -> some View{
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .mask(Circle())
            .frame(width: radius)
    }
}
