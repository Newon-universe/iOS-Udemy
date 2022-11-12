//
//  IsometricView.swift
//  Book Animation
//
//  Created by Kim Yewon on 2022/11/01.
//

import SwiftUI

struct CustomProjection: GeometryEffect {
    var value: CGFloat
    
    var animatableData: CGFloat {
        get { return value }
        set {
            value = newValue
        }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        var transform = CATransform3DIdentity
        transform.m11 = value == 0 ? 0.0001: value
        return .init(transform)
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
