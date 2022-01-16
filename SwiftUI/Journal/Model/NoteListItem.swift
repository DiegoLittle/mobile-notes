//
//  JournalEntry.swift
//  Journal
//
//  Created by Diego Little on 10/16/21.
//

import Foundation

struct NoteListItem: Codable, Identifiable {
    var id: UUID
    var title: String
    var description: String
}
