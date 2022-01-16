//
//  EntryListView.swift
//  Journal
//
//  Created by Diego Little on 10/16/21.
//

import SwiftUI

struct NoteListView: View {
    @ObservedObject var viewModel = NoteListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.viewModel.noteList){ note in
                    NavigationLink(destination: NoteView(noteViewModel: NoteViewModel(note))
                    ){
                        Text(note.title)
                    }
                }
                .onDelete(perform: self.viewModel.deleteNote)
            }
            .navigationBarTitle("Notes")
            .navigationBarItems(trailing: NavigationLink(destination:NoteView()) {
                            Image(systemName: "plus")
                                .resizable()
                                .padding(6)
                                .frame(width: 24, height: 24)
                                .background(Color.blue)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        } )
    
        }
        .onAppear {
            self.viewModel.getNotes()
        }

    }

}
