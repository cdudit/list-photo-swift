//
//  PhotoDetailView.swift
//  ListPhotoSwift
//
//  Created by Clément Dudit on 06/04/2022.
//

import SwiftUI

struct PhotoDetailView: View {
    @ObservedObject var viewModel: PhotoDetailViewModel
    
    init(viewModel: PhotoDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Image(uiImage: viewModel.uiImage)
                .resizable()
                .scaledToFill()
                .padding()
            Spacer()
            Button(action: {
                viewModel.isShareDisplayed.toggle()
            }, label: {
                Label("Share", systemImage: "square.and.arrow.up")
            })
            .sheet(isPresented: $viewModel.isShareDisplayed, content: {
                ShareSheet(photo: viewModel.uiImage, title: viewModel.title)
            })
            .navigationTitle(viewModel.title)
        }
    }
}
