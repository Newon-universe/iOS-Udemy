//
//  DishCell.swift
//  Preview Practice
//
//  Created by Kim Yewon on 2022/09/26.
//

import Foundation
import SwiftUI

struct DishCell: View {
    
    let dish: Dish
    
    var body: some View {
        
        HStack {
            Image("e1")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("Puppy")
                Text("cute")
            }
        }
        
    }
}

struct DishCell_Preview: PreviewProvider {

//    let size = DynamicTypeSize.allCases

    static var previews: some View {

        Group {

            ForEach(DynamicTypeSize.allCases, id: \.self) { size in
                DishCell(dish: Dish.all()[0])
                    .previewLayout(.sizeThatFits)
                    .environment(\.dynamicTypeSize, size)
                    .preferredColorScheme(.dark)
                    .previewDevice("iPhone SE")
            }

        }
    }
}

struct DishesTableViewControllerPreviews: PreviewProvider, UIViewControllerRepresentable {
    
    typealias UIViewControllerType = Controller
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: "DishesTableViewcOntroller")
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    static var previews: some View {
        DishesTableViewControllerPreviews()
    }
    
}
