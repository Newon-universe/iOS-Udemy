//
//  ViewController.swift
//  AsyncWithCombine
//
//  Created by Kim Yewon on 2023/09/11.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private let vm = ViewModel()
    private var cancellabel: AnyCancellable?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        vm.fetch_by_completion { result in
            switch result {
            case .success(let posts):
                print("----- Completion fetch ------")
            case .failure(let error):
                print("----- Completion fail \(error.localizedDescription) -------")
            }
        }
        
        Task {
            let posts = await vm.fetch_by_async_combine()
            
            cancellabel = posts.sink(
                receiveCompletion: { status in
                    switch status {
                    case .finished: break
                    case .failure(let error):
                        print("Receiver error \(error)")
                        break
                    }
                },
                receiveValue: { posts in
                    print("ㅁㅁㅁㅁㅁ async combine fetch ㅁㅁㅁㅁㅁㅁ")
                }
            )
        }
        
        Task {
            let result = await vm.legacy_fetchPosts()
            switch result {
            case .success(let posts):
                print("ㅇㅇㅇㅇㅇ continuation_resume fetch ㅇㅇㅇㅇㅇㅇ ")
            case .failure(let error):
                print("ㅇㅇㅇㅇㅇ continuation_resume error \(error)ㅇㅇㅇㅇㅇㅇㅇ")
            }
        }
        
        
        Task {
            do {
                let posts = try await vm.legacyV2_fetchPosts()
                print("****** continuation throw fetch ******")
            } catch {
                print("****** continuation throw error \(error)*******")
            }
        }
    }
}

