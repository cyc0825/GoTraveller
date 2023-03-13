//
//  PostView.swift
//  Worldie
//
//  Created by 曹越程 on 2023/3/7.
//

import SwiftUI
import PhotosUI

struct PostView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var context: String = ""
    @State var image: [PhotosPickerItem] = []
    @State var selectedImages: [Image] = []
    @Binding var cards: [Card]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Spacer()
                    TextField(
                        "Say something...",
                        text: $title,
                        axis: .vertical
                    )
                    .frame(width: 400, height: 50, alignment: .center)
                    .textFieldStyle(OvalTextFieldStyle())
                    .lineLimit(1)
                    
                    Spacer()
                    TextField(
                        "Enter More description",
                        text: $context,
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
                        if(selectedImages.isEmpty){
                            Image("add")
                                .resizable()
                                .frame(width: 400, height: 400)
                                .cornerRadius(20)
                        }
                        else{
                            TabView {
                                ForEach(0..<selectedImages.count, id: \.self) { i in
                                    selectedImages[i]
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
                             selectedImages.removeAll()
                             for item in image {
                                 if let data = try? await item.loadTransferable(type: Data.self) {
                                     if let uiImage = UIImage(data: data) {
                                         let image = Image(uiImage: uiImage)
                                         selectedImages.append(image)
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
                if(selectedImages.isEmpty){
                    Text("POST")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal,20)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                else{
                    Button{
                        let card = Card(title: title, context: context, image: selectedImages)
                        cards.append(card)
                        dismiss()
                    } label: {
                        Text("POST")
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

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(cards: Binding.constant([]))
    }
}
