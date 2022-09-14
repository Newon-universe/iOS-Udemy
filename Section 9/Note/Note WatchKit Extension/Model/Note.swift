//
//  Note.swift
//  Note WatchKit Extension
//
//  Created by Kim Yewon on 2022/09/14.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
