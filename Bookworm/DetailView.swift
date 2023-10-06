//
//  DetailView.swift
//  Bookworm
//
//  Created by Aaron Brown on 10/7/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) private var dismiss
    
    @State var showingDeletionAlert = false
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundColor(.secondary)
            Text(book.review ?? "No Review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingDeletionAlert.toggle()
                } label: {
                    Label("Delete", systemImage: "trash.fill")
                    .foregroundColor(.red)                }
            }
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingDeletionAlert) {
            Alert(title: Text("Delete Book"),message: Text("Are you sure?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Delete"),action: {
                moc.delete(book)
                try? moc.save()
                
                dismiss()
            }))
        }
    }
}


