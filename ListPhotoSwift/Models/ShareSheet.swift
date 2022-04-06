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
        let itemSource = ShareActivityItemSource(title: title, text: "Picture")
        
        let activityItems: [Any] = [photo, title, itemSource]
        
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: nil
        )
        
        return controller
    }
      
    func updateUIViewController(_ vc: UIActivityViewController, context: Context) {
    }
}

class ShareActivityItemSource: NSObject, UIActivityItemSource {
    var title: String
    var text: String
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
        super.init()
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return text
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return text
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
        return title
    }

    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let metadata = LPLinkMetadata()
        metadata.title = title
        return metadata
    }
}
