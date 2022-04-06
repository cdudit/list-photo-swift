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
    
    func addPicture() {
        print(selectedPicture.ciImage)
        if let url = selectedPicture.ciImage?.url {
            print("here")
            photos.append(Picture(
                viewModel: PhotoDetailViewModel(),
                url: url
            ))
        }
    }
}
