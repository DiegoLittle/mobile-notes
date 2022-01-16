//
//  Comments.swift
//  Journal
//
//  Created by Diego Little on 11/2/21.
//

import Foundation
import SwiftUI

struct Comments: Codable, Identifiable {
    var id: Int
    let name: String
    let email: String
    let body: String
    
}
