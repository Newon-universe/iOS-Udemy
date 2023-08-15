//
//  PhotoViewModel.swift
//  CoreDataImage
//
//  Created by Kim Yewon on 2023/08/15.
//

import Foundation
import UIKit
import Combine
import CoreData

enum MyCustomError: Error {
    case urlSessionError(Error)
    case imageConversionError
    // Add more cases as needed
    
    var localizedDescription: String {
        switch self {
        case .urlSessionError(let error):
            return "URLSession error: \(error.localizedDescription)"
        case .imageConversionError:
            return "Image conversion error"
        // Handle other cases
        }
    }
}

class PhotoViewModel: ObservableObject {
    
    @Published var image: UIImage?
    
    private var cancellabels = Set<AnyCancellable>()
    private var context = CoreDataManager.shared.persistentContainer.viewContext
    
    init() {
        let request: NSFetchRequest<Photo> = NSFetchRequest(entityName: "Photo")
        
        do {
            let photos: [Photo] = try context.fetch(request)
            if let photo = photos.last {
                self.image = photo.content
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func downloadImage() {
        let url = URL(string: "https://picsum.photos/200/300?id=\(UUID().uuidString)")!
        URLSession.shared.dataTaskPublisher(for: url)
            .mapError { error in
                // Handle URLSession errors here
                return MyCustomError.urlSessionError(error)
            }
            .flatMap { (data: Data, response: URLResponse) -> AnyPublisher<UIImage?, MyCustomError> in
                // Convert data to UIImage
                let image = UIImage(data: data)
                return Just(image)
                    .setFailureType(to: MyCustomError.self)
                    .eraseToAnyPublisher()
            }
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        switch error {
                        case .urlSessionError(let urlSessionError):
                            print("URLSession error: \(urlSessionError)")
                        case .imageConversionError:
                            print("Image conversion error")
                        }
                    }
            }, receiveValue: { image in
                let photo = Photo(context: self.context)
                photo.title = "Random Photo"
                photo.content = image
                try? self.context.save()
                
                self.image = image
            })
            .store(in: &cancellabels)
        
            
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            let photo = Photo(context: self.context)
//            photo.title = "Random Photo"
//            photo.content = UIImage(data: data)
//
//            try? self.context.save()
//
//            DispatchQueue.main.async {
//                self.image = photo.content
//            }
//
//        }.resume()
    }
}
