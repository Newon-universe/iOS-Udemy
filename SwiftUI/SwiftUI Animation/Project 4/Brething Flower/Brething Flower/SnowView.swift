//
//  SnowView.swift
//  Brething Flower
//
//  Created by Kim Yewon on 2022/11/10.
//

import SwiftUI

struct SnowView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        // configure the screen
        let screen = UIScreen.main.bounds
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screen.width, height: screen.height))

        // Indicate to the system whether sub layers are clipped to the layes bounds.
        // Sub layers are any layers or views that will be added in the code later
        // If you want to cliped by bounds, give it true
        view.layer.masksToBounds = true
        
        
        // configure the emitter
        // emitter is a box that holds thousands of confetti particles.
        // each of confetti particles would be a cell (e.g, snow flakes).
        let emitter = CAEmitterLayer()
        emitter.frame = CGRect(x: 200, y: -100, width: view.frame.width, height: view.frame.height)
        
        // configure the cell
        let cell = CAEmitterCell() // cell instance
        cell.birthRate = 40 // birth rate refers to how fast each cell will be made.
        cell.lifetime = 25 // lifetime refers to how long do you want to keep the cell on the screen before it gets removed.
        cell.velocity = 60 // how fast the vcell moves on the screen.
        cell.scale = 0.025 // how big do you want the cell
        cell.emissionRange = CGFloat.pi // emission range refers to how far do you want to spread out the cells as they're being emitted
        cell.contents = UIImage(named: "snow")?.cgImage // contents of cell to an image of our choice.
        
        emitter.emitterCells = [cell] // add cell into emitter
        view.layer.addSublayer(emitter) // adds all of those cells to the top layer or the main layer of the view.
        
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

struct SnowView_Previews: PreviewProvider {
    static var previews: some View {
        SnowView()
            .background(Color.black)
    }
}
