//
//  Home.swift
//  Isometric Animation
//
//  Created by Kim Yewon on 2022/11/02.
//

import SwiftUI

struct Home: View {
    
    @State private var animate: Bool = false
    //MARK: - Animation Properties
    @State private var b: CGFloat = 0
    @State private var c: CGFloat = 0
    
    var body: some View {
        //MARK: - Declare your own View's Here
        
        VStack(spacing: 20) {
            IsometricView(depth: animate ? 1.5 : 0) {
                ImageView()
            } bottom: {
                Rectangle()
                    .fill(Color.blue)
            } side: {
                Rectangle()
                    .fill(Color.green)
            }
            .frame(width: 180, height: 330)
            //MARK: - Animating It with Projection's
            // play with your projection values
            // Projection needs animatable data
            .modifier(CustomProjection(b: b, c: c))
            .rotation3DEffect(.init(degrees: animate ? 45 : 0), axis: (x: 0, y: 0, z: 1))
            .scaleEffect(0.75)
            .offset(x: animate ? 12 : 0)
            
            VStack(alignment: .leading, spacing: 25) {
                Text("Isometric Trasforms")
                    .font(.title.bold())
                
                HStack {
                    Button("Animate") {
//                        withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.5)) {
//                            animate = true
//                            b = -0.2
//                            c = -0.3
//                        }
                        // slow ver
                        withAnimation(.easeInOut(duration: 2.5)) {
                            animate = true
                            b = -0.2
                            c = -0.3
                        }
                    }
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    
                    
                    Button("Reset") {
                        withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.5)) {
                            animate = false
                            b = 0
                            c = 0
                        }
                    }
                    .buttonStyle(.bordered)
                    .tint(.blue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 15)
            .padding(.top, 20)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    
    @ViewBuilder
    func ImageView() -> some View {
        Image("bird")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 180, height: 330)
            .clipped()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct CustomProjection: GeometryEffect {
    var b: CGFloat
    var c: CGFloat
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { return AnimatablePair(b, c) }
        set {
            b = newValue.first
            c = newValue.second
        }
    }
    
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        return .init(.init(a: 1, b: b, c: c, d: 1, tx: 0, ty: 0))
    }
}


struct IsometricView<Content: View, Bottom: View, Side: View>: View {
    var content: Content
    var bottom: Bottom
    var side: Side
    
    //MARK: - Isometric Depth
    var depth: CGFloat
    
    init(
        depth: CGFloat,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder bottom: @escaping () -> Bottom,
        @ViewBuilder side: @escaping () -> Side
    ) {
        self.depth = depth
        self.content = content()
        self.bottom = bottom()
        self.side = side()
    }
    
    var body: some View {
        ZStack {
            Color.clear
            // For Geometry to make the specified space
                .overlay {
                    GeometryReader {
                        let size = $0.size
                        
                        ZStack {
                            content
                            
                            DepthView(isBottom: true, size: size)
                            DepthView(size: size)
                        }
                        .frame(width: size.width, height: size.height)
                    }
                }
        }
    }
    
    //MARK: - Depth View's
    @ViewBuilder
    func DepthView(isBottom: Bool = false, size: CGSize) -> some View {
        ZStack {
            
            //MARK: - If you don't want original image but needed a stretch at the sidees & bottom use this method
            
            if isBottom {
                bottom
                    .scaleEffect(y: depth, anchor: .bottom)
                    .frame(height: depth, alignment: .bottom)
                //MARK: - Dimmiing content with blur
                    .overlay {
                        Rectangle()
                            .fill(.black.opacity(0.25))
                            .blur(radius: 2.5)
                    }
                    .clipped()
                // Apply Transforms
                // Your Custom Projection Values
                    .projectionEffect(.init(.init(a: 1, b: 0, c: 1, d: 1, tx: 0, ty: 0)))
//                    .projectionEffect(.init(.init(a: 1, b: 0, c: -1, d: 1, tx: 0, ty: 0)))
                    .offset(y: depth)
                    .frame(maxHeight: .infinity, alignment: .bottom)

            } else {
                side
                    .scaleEffect(y: depth, anchor: .trailing)
                    .frame(width: depth, alignment: .trailing)
                    .overlay {
                        Rectangle()
                            .fill(.black.opacity(0.25))
                            .blur(radius: 2.5)
                    }
                    .clipped()
                // Apply Transforms
                // Your Custom Projection Values
                    .projectionEffect(.init(.init(a: 1, b: 1, c: 0, d: 1, tx: 0, ty: 0)))
//                    .projectionEffect(.init(.init(a: 1, b: -1, c: 0, d: 1, tx: 0, ty: 0)))
                //MARK: - Change offset, Transform values for your wish
                    .offset(x: depth)
//                    .offset(x: -depth, y: depth)
                    .frame(maxWidth: .infinity, alignment: .trailing)
//                    .frame(maxWidth: .infinity, alignment: .leading)

            }
        }
    }
    
}
