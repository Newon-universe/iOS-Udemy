//
//  BookStore.swift
//  Danca
//
//  Created by Kim Yewon on 2022/11/12.
//

import Foundation
import SwiftUI

class Library {
    static var shared: Library {
        return Library()
    }
    
    func loadBooks() -> [Book] {
        let books: [Book] = [
            Book(
                coverImage: Image("cover"), section: [
                    Section(
                        title: "Test Voca",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca2",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca3",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca4",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    )
                ]
            ),
            Book(
                coverImage: Image("cover"), section: [
                    Section(
                        title: "Test Voca",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca2",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca3",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca4",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    )
                ]
            ),
            Book(
                coverImage: Image("cover"), section: [
                    Section(
                        title: "Test Voca",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca2",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca3",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca4",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    )
                ]
            ),
            Book(
                coverImage: Image("cover"), section: [
                    Section(
                        title: "Test Voca",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca2",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca3",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca4",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    )
                ]
            ),
            Book(
                coverImage: Image("cover"), section: [
                    Section(
                        title: "Test Voca",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca2",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca3",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca4",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    )
                ]
            ),
            Book(
                coverImage: Image("cover"), section: [
                    Section(
                        title: "Test Voca",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca2",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca3",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca4",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    )
                ]
            ),
            Book(
                coverImage: Image("cover"), section: [
                    Section(
                        title: "Test Voca",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca2",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca3",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca4",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    )
                ]
            ),
            Book(
                coverImage: Image("cover"), section: [
                    Section(
                        title: "Test Voca",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca2",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca3",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca4",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    )
                ]
            ),
            Book(
                coverImage: Image("cover"), section: [
                    Section(
                        title: "Test Voca",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca2",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca3",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    ),
                    Section(
                        title: "Test Voca4",
                        words: [Word(studyWord: "Apple", translatedWord: "사과"), Word(studyWord: "Banana", translatedWord: "바나나"), Word(studyWord: "Citrus", translatedWord: "이게 오렌지였나")],
                        date: Date()
                    )
                ]
            )
        ]
        
        return books
    }
    
}
