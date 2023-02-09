//
//  HomeView.swift
//  GoogleBookAPI
//
//  Created by Anis on 06/02/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Titre", text: $viewModel.keyword)
                TextField("Auteur", text: $viewModel.author)
                Button {
                    viewModel.search()
                } label: {
                    Text("Rechercher")
                }
                if let items = viewModel.results?.items {
                    List(items, id:\.uuid) { result in
                        VStack(alignment: .leading) {
                            if let image = result.volumeInfo.imageLinks?.thumbnail {
                                ZStack {
                                    Button {
                                        print(result.id)
                                    } label: {
                                        Image(systemName: "bookmark")
                                    }
                                    AsyncImage(url: URL(string: image))
                                }
                            }
                            Text(result.volumeInfo.title)
                        }
                    }
                }
            }.navigationTitle("Ebook")
        }
    }
}
