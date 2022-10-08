//
//  ImagePicker.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/08.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Environment(\.dismiss) var disMissMode
    
    // When you want UIKit components, actually that is UIViewController
    // UI view controller, representable protocol where we it allows us to actually work with the UIViewController
    // and it extracts the view from the View controller and represents it as a SwiftUI view.
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    // Creates actual ViewController that we need, we're trying to represent in the context of SwiftUI
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    // How we handle the actions that happened in The ViewController and link them back to out SwiftUI View
    // Working with the UIView Controller inside of a SwiftUI View or SwiftUI Application built only SwiftUI
    // There is gap in communication, so we need to figure out how to make a ViewController talk to a SwiftUI View when actions happen in that,
    // Coordinator do that for us. It's going to handle and coordinate all the stuffs.
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            self.parent.image = image
            self.parent.disMissMode.callAsFunction()
            
        }
        // This function handle the action for when the user actually selects an image from that in UIImagePicker
    }
}

