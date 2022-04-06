//
//  ShareSheet.swift
//  ListPhotoSwift
//
//  Created by Clément Dudit on 06/04/2022.
//

import UIKit
import SwiftUI
import LinkPresentation

struct ShareSheet: UIViewControllerRepresentable {
    let photo: UIImage
    let title: String
          
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let itemSource = ShareActivityItemSource(shareText: title, shareImage: photo)
        
        let activityItems: [Any] = [photo, title, itemSource]
        
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: nil)
        
        return controller
    }
      
    func updateUIViewController(_ vc: UIActivityViewController, context: Context) {
    }
}

class ShareActivityItemSource: NSObject, UIActivityItemSource {
    
    var shareText: String
    var shareImage: UIImage
    var linkMetaData = LPLinkMetadata()
    
    init(shareText: String, shareImage: UIImage) {
        self.shareText = shareText
        self.shareImage = shareImage
        linkMetaData.title = shareText
        super.init()
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return UIImage(named: "AppIcon ") as Any
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return nil
    }
    
    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        return linkMetaData
    }
}
