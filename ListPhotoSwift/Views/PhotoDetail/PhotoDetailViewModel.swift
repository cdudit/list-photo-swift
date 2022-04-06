//
//  PhotoDetailViewModel.swift
//  ListPhotoSwift
//
//  Created by Clément Dudit on 06/04/2022.
//

import Foundation
import UIKit

class PhotoDetailViewModel: ObservableObject {
    @Published var uiImage: UIImage
    @Published var title: String
    @Published var isShareDisplayed = false
    
    init(uiImage: UIImage, title: String) {
        self.uiImage = uiImage
        self.title = title
    }
}
