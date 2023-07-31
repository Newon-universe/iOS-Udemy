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

struct TextFieldView: View {
    
    @State private var stateString: String = ""
    @State private var emailString: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        VStack {
            Text("Playing with TextField")
                .font(.largeTitle)
                .foregroundColor(.black)
            
            TextField("Place holder text", text: $stateString)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.init(top: 40, leading: 20, bottom: 100, trailing: 20))
            
            Text("This text has just been updated:\n \(stateString)")
                .font(.custom("serif", size: 24))
                .foregroundColor(.black)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            TextField("Enter an email address", text: $emailString, onEditingChanged: { status in
                    print("keyboard tapped status - \(status)")
                    print(self.$emailString.wrappedValue)
            }) {
                print("The return key has been pressed")
            }
            .textContentType(.emailAddress)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.subheadline)
            .fixedSize()
            .padding()
            
            Spacer()
            
            Text("A secure textField")
                .font(.largeTitle)
                .padding(.init(top: 10, leading: 20, bottom: 5, trailing: 20))
            
            SecureField("Enter your password", text: $password) {
                print("\(password)")
                print("Returned pressed - done!")
            }
            .foregroundColor(.red)
            .frame(height: 40)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .border(Color.black, width: 0.4)
            .padding()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            ContentView()
//            ContentView2()
            TextFieldView()
        }
    }
}
