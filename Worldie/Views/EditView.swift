//
//  EditView.swift
//  Worldie
//
//  Created by 曹越程 on 2023/4/12.
//

import SwiftUI
import PhotosUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    @State var image: [PhotosPickerItem] = []
    @State var index: Int = 0
    @Binding var card: Card
    @Binding var cards: [Card]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Spacer()
                    TextField(
                        "Say something...",
                        text: $card.title,
                        axis: .vertical
                    )
                    .frame(width: 400, height: 50, alignment: .center)
                    .textFieldStyle(OvalTextFieldStyle())
                    .lineLimit(1)
                    
                    Spacer()
                    TextField(
                        "Enter More description",
                        text: $card.context,
                        axis: .vertical
                    )
                    .frame(width: 400, height: 50, alignment: .center)
                    .padding(130)
                    .textFieldStyle(OvalTextFieldStyle())
                    .multilineTextAlignment(.leading)
                    .lineLimit(13...13)
                    Spacer()
                    PhotosPicker(selection: $image,
                                 matching: .images){
                        if(card.image.isEmpty){
                            Image("add")
                                .resizable()
                                .frame(width: 400, height: 400)
                                .cornerRadius(20)
                        }
                        else{
                            TabView {
                                ForEach(0..<card.image.count, id: \.self) { i in
                                    card.image[i]
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 400, height: 400)
                                }
                            }
                            .tabViewStyle(PageTabViewStyle())
                            .frame(width: 400, height: 400)
                            .onAppear {
                                setupAppearance()
                            }
                        }
                    }
                     .onChange(of: image){ _ in
                         Task {
                             for item in image {
                                 if let data = try? await item.loadTransferable(type: Data.self) {
                                     if let uiImage = UIImage(data: data) {
                                         let image = Image(uiImage: uiImage)
                                         card.image.append(image)
                                     }
                                 }
                             }
                         }
                     }
                }
                .padding(8)
            }
            .scrollDismissesKeyboard(.interactively)
        }
        
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                if(card.image.isEmpty){
                    Text("SAVE")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal,20)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                else{
                    Button{
                        cards[index] = card
                        dismiss()
                    } label: {
                        Text("SAVE")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal,20)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(card: Binding.constant(Card()), cards: Binding.constant([]))
    }
}

