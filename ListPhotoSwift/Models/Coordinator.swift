//
//  Coordinator.swift
//  ListPhotoSwift
//
//  Created by Clément Dudit on 06/04/2022.
//

import UIKit
import SwiftUI

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var parent: ImagePicker

    init(_ parent: ImagePicker) {
        self.parent = parent
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            parent.selectedImage = image
        }
        if let url = info[.imageURL] as? URL {
            parent.selectedUrl = url
        }
        parent.presentationMode.wrappedValue.dismiss()
    }
}
