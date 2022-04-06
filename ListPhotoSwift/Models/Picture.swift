//
//  Picture.swift
//  ListPhotoSwift
//
//  Created by Clément Dudit on 06/04/2022.
//

import Foundation

struct Picture {
    let id = UUID()
    var viewModel: PhotoDetailViewModel
    var title: String
}
