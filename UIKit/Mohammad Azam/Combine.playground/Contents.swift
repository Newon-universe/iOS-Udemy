import UIKit
import Combine

//MARK: - basic
//["A", "B", "C", "D", "E"].publisher.sink {
//    print($0)
//}

//MARK: - collect
//["A", "B", "C", "D", "E"].publisher.collect(3).sink {
//    print($0)
//}

//MARK: - formatting
//let formatter = NumberFormatter()
//formatter.numberStyle = .spellOut
//
//[123, 45, 67].publisher.map { item in
//    formatter.string(from: NSNumber(integerLiteral: item)) ?? ""
//}.sink {
//    print($0)
//}

//MARK: - Key
//struct Point {
//    let x: Int
//    let y: Int
//}
//
//let publisher = PassthroughSubject<Point, Never>()
//
//publisher.map(\.x, \.y).sink { x, y in
//    print("x is \(x), y is \(y)")
//}
//
//publisher.send(Point(x: 5, y: 4))

//MARK: - flat map

//struct School {
//    let name: String
//    let noOfStudents: CurrentValueSubject<Int, Never> // Subscriber, only gets <Int, Never> type
//
//    init(name: String, noOfStudents: Int) {
//        self.name = name
//        self.noOfStudents = CurrentValueSubject(noOfStudents)
//    }
//}
//
//
//let citySchool = School(name: "Fountain Head School", noOfStudents: 100)
//
//let school = CurrentValueSubject<School, Never>(citySchool)
//
//school
//    .flatMap {
//        $0.noOfStudents
//    }
//    .sink {
//        print($0)
//    }
//
//
//let townSchool = School(name: "Town Head School", noOfStudents: 45)
//
//school.value = townSchool
//
//citySchool.noOfStudents.value += 1
//townSchool.noOfStudents.value += 100


//MARK: - Replace nil

//["A", "B", nil, "C"].publisher.replaceNil(with: "*").sink {
//    print($0)
//}


//MARK: - Replace empty
// For case when you just don't want to pass a value but want to say that I'm done or this task has been completed without passing the value.
//let empty = Empty<Int, Never>()
//
//empty
//    .replaceEmpty(with: 0) // This is the value that will replace empty
//    .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })

//MARK: - Scan

//let publisher = (1...10).publisher
//
//publisher.scan([]) { numbers, value -> [Int] in
//    // numbers is initial values that init in .scan()
//    numbers + [value]
//}.sink {
//    print($0)
//}

//MARK: - Filter

//let numbers = (1...20).publisher
//numbers.filter { $0 % 2 == 0 }.sink { print($0) }


//MARK: - Duplicates

//let words = "apple apple fruit apple mango watermelon apple".components(separatedBy: " ").publisher
//words
//    .removeDuplicates()
//    .sink {
//    print($0)
//}

// removeDuplactes works with the sequnce, not for all value checking.
// It means unless it gets new value, it will ignore same value but after getting new value, than it will start again the origin value.


//MARK: - Compact map

//let strings = ["a", "1.24", "b", "3.45", "6.7"].publisher.compactMap { Float($0) }.sink {
//    print($0)
//}

// ignore nil output


//MARK: - ignore Output

//let numbers = (1...5000).publisher
//numbers.ignoreOutput().sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })



//MARK: - First, Last

//let numbers = (1...9).publisher
//numbers.first { $0 % 2 == 0 }.sink { print($0) }
//numbers.last { $0 % 2 == 0 }.sink { print($0) }


//MARK: - Drop, Drop While, Drop Until

//let numbers = (1...10).publisher
//numbers.dropFirst(5).sink { print($0) }
//numbers.drop { $0 % 3 != 0 }.sink { print($0) }

//let isReady = PassthroughSubject<Void, Never>()
//let taps = PassthroughSubject<Int, Never>()
//
//taps.drop(untilOutputFrom: isReady).sink { print($0) }
//
//(1...10).forEach { n in
//    taps.send(n)
//    if n == 4 { isReady.send() }
//}

//MARK: - Prefix, Prefix While, Prefix Until

//let numbers = (1...10).publisher
//numbers.prefix(2).sink { print($0) }
//numbers.prefix { $0 < 4 }.sink { print($0) }


//MARK: - Challenge

//let numbers = (1...100).publisher.dropFirst(50).filter { $0 % 2 == 0 }.prefix(10).sink { print($0) }

//MARK: - Prepend

//let numbers = (1...5).publisher
//let publisher2 = (500...510).publisher
//
//
//numbers
//    .prepend(100, 101)
//    .prepend(-1, -2)
//    .prepend([45, 67])
//    .prepend(publisher2)
//    .sink {
//    print($0)
//}

//MARK: - Append

//let numbers = (1...10).publisher
//let publisher2 = (100...110).publisher
//
//numbers
//    .append(11, 12)
//    .append(13, 14)
//    .append(publisher2)
//    .sink {
//    print($0)
//}


//MARK: - SwitchToLatest

//let publisher1 = PassthroughSubject<String, Never>()
//let publisher2 = PassthroughSubject<String, Never>()
//
//let publishers = PassthroughSubject<PassthroughSubject<String, Never>, Never>()
//// In case that some publisher contain other publishers, parent publisher's emit type should be same with child publishers.
//
//publishers.switchToLatest().sink {
//    print($0)
//}
//
//publishers.send(publisher1)
//
//publisher1.send("Publisher 1 - Value 1")
//publisher1.send("Publisher 1 - Value 2")
//publisher2.send("Publisher 2 - Value 1")
//
//publishers.send(publisher2) // switching to publisher 2
//
//publisher1.send("Publisher 1 - Value 3")
//publisher2.send("Publisher 2 - Value 2")

//MARK: - SwitchToLatest Practical example

//let images = ["mountain_rock", "somewhere", "uyuni"]
//var index = 0
//
//func getImage() -> AnyPublisher<UIImage?, Never> {
//
//    return Future<UIImage?, Never> { promise in
//        DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
//            promise(.success(UIImage(named: "\(images[index]).jpg")))
//        }
//    }
//    .print()
//    .map { $0 }
//    .receive(on: RunLoop.main)
//    .eraseToAnyPublisher()
//
//}
//let taps = PassthroughSubject<Void, Never>()
//
//let subscription = taps
//    .map { _ in getImage() }
//    .switchToLatest()
//    .sink {
//        print($0)
//    }
//
//// mountain
//taps.send()
//
////somewhere
//DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
//    index += 1
//    taps.send()
//}
//
////uyuni
//DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
//    index += 1
//    taps.send()
//}


//MARK: - Merge

//let publisher1 = PassthroughSubject<Int, Never>()
//let publisher2 = PassthroughSubject<Int, Never>()
//
//publisher1.merge(with: publisher2).sink {
//    print($0)
//}
//
//publisher1.send(10)
//publisher1.send(11)
//publisher2.send(12)
//publisher2.send(13)

//MARK: - AllSatisfy

//let publisher = [2, 4, 6, 8, 10].publisher
//
//publisher.allSatisfy { $0 % 2 == 0 }.sink { print($0) }



//MARK: - URLSession

//struct Post: Codable {
//    let title: String
//    let body: String
//}
//
//func getPosts() -> AnyPublisher<[Post], Error> {
//
//    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { fatalError("Invalid URL")}
//
//    return URLSession.shared.dataTaskPublisher(for: url)
//        .map { $0.data }
//        .decode(type: [Post].self, decoder: JSONDecoder())
//        .eraseToAnyPublisher()
//}
//
//let cancellable = getPosts().sink(receiveCompletion: { _ in }, receiveValue: { print($0) })

//MARK: - Debug by printing

//let publisher = (1...20).publisher
//
//publisher
//    .print("Debugging")
//    .sink {
//        print($0)
//    }


//MARK: - Debug, handle events

//guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { fatalError("Invalid URL")}
//
//let request = URLSession.shared.dataTaskPublisher(for: url)
//
//let subscription = request
//    .handleEvents(
//        receiveSubscription: { _ in print("Subscription Received") },
//        receiveOutput: { _, _ in print("Receive Output") },
//        receiveCompletion: { _ in print("Received Completion") },
//        receiveCancel: { print("Received cancel") },
//        receiveRequest: { _ in print("Received Request") }
//    )
//    .sink(receiveCompletion: { print($0) }, receiveValue: { data, response in print(data) })


//MARK: - Debug
