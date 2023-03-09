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

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: [UIImage]
    @Binding var isShown: Bool
    var any = PHPickerConfiguration(photoLibrary: .shared())
    var sourceType: UIImagePickerController.SourceType = .camera
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> ImagePicker.ImagePickerCoordinator {
        return ImagePicker.ImagePickerCoordinator(image: self)
    }
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configu = PHPickerConfiguration()
        configu.selectionLimit = 0
        configu.filter = any.filter
        let picker = PHPickerViewController(configuration: configu)
        picker.delegate = context.coordinator
        return picker
    }
    
    class ImagePickerCoordinator: NSObject, PHPickerViewControllerDelegate{
        
        var photo: ImagePicker
        init(image: ImagePicker) {
            photo = image
        }
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            self.photo.isShown.toggle()
            
            for photo in results {
                if photo.itemProvider.canLoadObject(ofClass: UIImage.self) {
                    photo.itemProvider.loadObject(ofClass: UIImage.self) {
                        (images, err) in guard let photos = images else{
                            print("\(String(describing: err?.localizedDescription))")
                            return
                        }
                        self.photo.image.append(photos as! UIImage)
                    }
                }
                else{
                    print("no loaded")
                }
            }
        }
    }
}
