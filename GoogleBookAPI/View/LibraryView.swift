//
//  LibraryView.swift
//  GoogleBookAPI
//
//  Created by Anis on 09/02/2023.
//

import Foundation
import SwiftUI

struct LibraryView: View {
    @State var books: [String] = []
    var body: some View {
        VStack {
            if books.isEmpty {
                Text("Aucun livre pour le moment")
            } else {
                List(books, id:\.self) { book in
                    Text(book)
                }
            }
        }.navigationTitle("Bibliothèque")
    }
}
