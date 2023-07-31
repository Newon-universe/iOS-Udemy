//
//  Array+Extensions.swift
//  GridLayout Practice
//
//  Created by Kim Yewon on 2022/09/21.
//

import Foundation

extension Array {
    
    func chunks(size: Int) -> [ArraySlice<Element>] {
        var chunks: [ArraySlice<Element>] = [ArraySlice<Element>]()  // Empty array
        
        for index in stride(from: 0, through: self.count - 1, by: size) {
            
            var chunk = ArraySlice<Element>() // make piece of chunks
            let end = index + size // declare last index
            
            if end >= self.count {
                chunk = self[index ..< count]
            } else {
                chunk = self[index ..< end]
            }
            
            chunks.append(chunk)
            
            
            // ..?
            if end + 1 == self.count {
                let remainingChunk = self[end ..< self.count]
                chunks.append(remainingChunk)
            }
        }
        
        return chunks
    }
    
    func printChunk() {
        print(self)
    }
    
}
