//
//  SubView.swift
//  Worldie
//
//  Created by 曹越程 on 2023/1/21.
//

import SwiftUI

struct SubView: View {
    @State var isNotificationEnabled: Bool = false
    @State var distance : Int = 100
    @Binding var deletedCards: [Card]
    @Binding var cards: [Card]
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(0..<deletedCards.count, id: \.self) {i in
                        HStack {
                            deletedCards[i]
                                .onTapGesture {
                                    self.cards.append(deletedCards[i])
                                    self.deletedCards.remove(at: i)
                                }
                                .onLongPressGesture {
                                    self.deletedCards.remove(at: i)
                                }
                        }
                    }
                }
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
        SubView(deletedCards: Binding.constant([]), cards: Binding.constant([]))
    }
}
