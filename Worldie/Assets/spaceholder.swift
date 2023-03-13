//
//  spaceholder.swift
//  Worldie
//
//  Created by 曹越程 on 2023/3/10.
//

import SwiftUI

struct spaceholder: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color.gray.opacity(0))
            .frame(width: UIScreen.main.bounds.width * 49 / 100, height: 0.01)
    }
}

struct spaceholder_Previews: PreviewProvider {
    static var previews: some View {
        spaceholder()
    }
}
