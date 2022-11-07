//
//  ContentView.swift
//  Text
//
//  Created by Kim Yewon on 2022/11/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .font(.custom("courier", size: 30))
                .fontWeight(.thin)
                .bold()
                .italic()
                .baselineOffset(4)
                .kerning(6)
                .underline(true, color: Color.green)
                .strikethrough(true, color: .red)
                .flipsForRightToLeftLayoutDirection(true)
            
            Divider()
            Spacer()
            
            Text("This is a really really really really really really really really  long string that will span multiple lines in the preview. Peter Piper picked a peck a pickled peppers.")
                .multilineTextAlignment(.center)
                .foregroundColor(.blue)
                .padding(20)
                .lineLimit(2)
                .lineSpacing(1)
                .allowsTightening(true)
                .truncationMode(.middle)
//                .padding([.leading, .trailing, .horizontal, .top])
                .overlay(alignment: .top) {
                    Text("Some overlayed text!")
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.blue.opacity(0.3))
                }
                .border(.red, width: 4)
            
            Spacer()
            
            Text("Hello SwiftUI")
                .background(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [.red, .yellow, .orange, .white]
                        ),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Spacer()
            
            Text("SwiftUI")
                .font(.largeTitle)
                .foregroundColor(.green)
//                .background(
//                    Image("cat")
//                        .resizable()
//                        .frame(
//                            width: UIScreen.main.bounds.size.width,
//                            height: UIScreen.main.bounds.size.height / 5
//                        )
//                )
                .padding(30)
                .background(Color.init(hue: 0.3, saturation: 1.2, brightness: 0.3, opacity: 0.7))
                .background(
                    RoundedRectangle(cornerRadius: 50)
                )
                
        }
    }
}

struct ContentView2: View {
    var body: some View {
        VStack {
            Text("SwiftUI Rocks")
                .font(.callout)
                .foregroundColor(.white)
                .frame(width: 150, height: 150)
                .background(Circle())
                .padding(50)
            
            Text("SwiftUI is fun and easy")
                .bold()
                .fontWeight(.medium)
                .foregroundColor(.red)
                .font(.largeTitle)
                .shadow(color: .black, radius: 1, x: 0, y: 2)
                .padding(50)
            
            Text("https://apple.com")
                .underline(true, color: .black)
                .font(.system(size: 24, design: .serif))
                .onTapGesture {
                    print("URL link has been tapped")
                }
            
            Text("Clip me")
                .font(.largeTitle)
                .frame(width: 300, height: 100)
                .background(Rectangle().fill(Color.orange))
                .clipped()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView2()
        }
    }
}
