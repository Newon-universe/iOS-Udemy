import UIKit
import Combine

struct ParseError: Error {}
func romanNumeral(from:Int) throws -> String {
    let romanNumeralDict: [Int : String] =
        [1:"I", 2:"II", 3:"III", 4:"IV", 5:"V"]
    guard let numeral = romanNumeralDict[from] else {
        throw ParseError()
    }
    return numeral
}
let numbers = [5, 4, 0, 3, 2, 1]
numbers.publisher
    .tryMap { try romanNumeral(from: $0) }
    .sink(
        receiveCompletion: { print ("completion: \($0)") },
        receiveValue: { print ("\($0)", terminator: " ") }
     )
