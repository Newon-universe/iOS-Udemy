//
//  Book.swift
//  Danca
//
//  Created by Kim Yewon on 2022/11/12.
//

import Foundation
import SwiftUI

struct Book {
    private var _coverImage: Image
    private var _section: [Section]?
    
    init(coverImage: Image, section: [Section]) {
        _coverImage = coverImage
        _section = section
    }
    
    var coverImage: Image {
        get { _coverImage }
        set { _coverImage = newValue }
    }
    
    var numberOfPages: Int {
        if let section = _section {
            return section.count
        }
        return 0
    }
    
    mutating func makeSections(_ newValue: [Section]) {
        _section = newValue
    }
    
    mutating func addSection(_ newValue: Section) {
        if numberOfPages == 0 {
            _section = [newValue]
        } else {
            _section?.append(newValue)
        }
    }
    
    func getSection(index: Int) -> Section {
        guard let sections = _section else {
            fatalError("No section")
        }
        
        guard let section = sections[safe: index] else {
            fatalError("DEBUG:: No section for \(index)")
        }
        
        return section
    }
    
    mutating func removeSection(index: Int) {
        self._section?.remove(at: index)
    }
    
    mutating func editSection(index: Int, newSection: Section) {
        if _section?[safe: index] != nil {
            _section?[index] = newSection
        }
    }
}

enum WordsType {
    case studyWord(String) // The words you want to remember or study
    case translatedWord(String) // The words what is tranlated by your language
    case examples(String?) // Examples or pratices expression for studying words
    case image(Image?) // Example image for studying words
}

struct Section {
    var title: String?
    var words: [Word]?
    var date: Date
}

struct Word {
    var studyWord: String
    var translatedWord: String
    var examples: [String]? = nil
    var image: Image? = nil
}
