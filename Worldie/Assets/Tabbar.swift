//
//  Tabbar.swift
//  GoTraveller
//
//  Created by 曹越程 on 2023/1/19.
//

import SwiftUI
import PhotosUI

struct Tabbar: View {
    @State var selected = 0;
    @State var photoIndex = 0;
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var userSwiping: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State var image: [PhotosPickerItem] = []
    @State var selectedImages: [Image] = []
    @State var navigated = false
    
    var body: some View {
        VStack(){
            TabView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .frame(width: 400, height: 400)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(width: 400, height: 400)
            HStack(){
                Spacer()
                Button{
                    selected = 0
                }label: {
                    Text("Story")
                        .fontWeight(selected == 0 ? .bold:.regular)
                        .foregroundColor(selected == 0 ? .black: .gray)
                }
                Spacer()
                PhotosPicker(selection: $image,
                             matching: .images){
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal,20)
                        .background(Color.accentColor)
                        .cornerRadius(10)
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
                Spacer()
                
                Button{
                    selected = 1
                }label: {
                    Text("Plan")
                        .fontWeight(selected == 1 ? .bold:.regular)
                        .foregroundColor(selected == 1 ? .black: .gray)
                }
                Spacer()
                
            }
            .padding(8)
            .background(Color.white)
        }
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
