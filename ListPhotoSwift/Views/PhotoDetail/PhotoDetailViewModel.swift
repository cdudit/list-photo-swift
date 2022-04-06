//
//  PhotoDetailViewModel.swift
//  ListPhotoSwift
//
//  Created by Clément Dudit on 06/04/2022.
//

import Foundation
import UIKit

class PhotoDetailViewModel: ObservableObject {
    @Published var picture: Picture
    @Published var uiImage: UIImage
    @Published var isShareDisplayed = false
    
    init(picture: Picture) {
        self.picture = picture
        self.uiImage = UIImage(data: picture.data) ?? UIImage()
    }
}
