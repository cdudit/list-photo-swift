//
//  ListPhotoViewModel.swift
//  ListPhotoSwift
//
//  Created by Clément Dudit on 06/04/2022.
//

import Foundation
import UIKit

class ListPhotoViewModel: ObservableObject {
    @Published var photos: [Picture] = [Picture]()
    @Published var isPickerDisplayed = false
    @Published var selectedPicture: UIImage = UIImage()
    @Published var url: URL? = nil
    
    func addPicture() {
        if let data = selectedPicture.jpegData(compressionQuality: 0.8) {
            let title = url?.absoluteString ?? "Foo"
            photos.append(Picture(
                viewModel: PhotoDetailViewModel(uiImage: UIImage(data: data) ?? UIImage(), title: title),
                title: title
            ))
        }
    }
}
