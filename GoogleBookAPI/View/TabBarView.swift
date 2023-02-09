//
//  TabBarView.swift
//  GoogleBookAPI
//
//  Created by Anis on 06/02/2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "magnifyingglass").accentColor(.black)
                    Text("Rechercher").foregroundColor(.primary)
                }
            LibraryView()
                .tabItem {
                    Image(systemName: "books.vertical.circle").accentColor(.black)
                    Text("Bibliothèque").foregroundColor(.primary)
                }
        }
    }
}
