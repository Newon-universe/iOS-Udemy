//
//  ContentView.swift
//  GridLayout Practice
//
//  Created by Kim Yewon on 2022/09/21.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Property
    let animals = ["🐈","🐆","🦌","🦒","🦏","🐄","🐀","🦩","🦜"]
    @State private var sliderValue: CGFloat = 1
    
    //MARK: - Body
    

    var body: some View {
        
        NavigationView {
            
            VStack {
                Slider(value: $sliderValue, in: 1...8, step: 1)
                Text(String(format: "%.0f", self.sliderValue))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding()
                    .background(.purple)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                
                List(self.animals.chunks(size: Int(self.sliderValue)), id:\.self) { chunk in
                    ForEach(chunk, id: \.self) { animal in
                        Text(animal)
                            .font(.system(size: CGFloat(300/self.sliderValue)))
                    }// Loop
                }//: List
            }//: VStack
        }
        .navigationTitle("Animals")
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


