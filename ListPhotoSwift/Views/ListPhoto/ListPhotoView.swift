//
//  ListPhotoView.swift
//  ListPhotoSwift
//
//  Created by Clément Dudit on 06/04/2022.
//

import SwiftUI

struct ListPhotoView: View {
    @ObservedObject private var viewModel = ListPhotoViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.photos, id: \.id) { photo in
                    NavigationLink(photo.title) {
                        PhotoDetailView(viewModel: PhotoDetailViewModel(picture: photo))
                    }
                }
            }
            .navigationTitle("Vision")
            .toolbar {
                Button {
                    viewModel.isPickerDisplayed.toggle()
                } label: {
                    Image(systemName: "camera")
                }
            }
            .sheet(isPresented: $viewModel.isPickerDisplayed) {
                viewModel.addPicture()
            } content: {
                ImagePicker(selectedImage: $viewModel.selectedPicture, selectedUrl: $viewModel.url)
            }
        }
    }
}
