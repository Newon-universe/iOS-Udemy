//
//  ContentView.swift
//  Image
//
//  Created by Kim Yewon on 2022/11/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Image("shone")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Image(systemName: "faceid")
                .font(.largeTitle)
                .padding()
            
            Image(systemName: "wifi")
                .imageScale(.large)
                .foregroundColor(.red)
                .frame(width: 100, height: 100)
                .background(Color.black)
                .font(.system(size: 50))
                .padding()
            
            Image(systemName: "person.icloud.fill")
                .font(.system(size: 50))
                .blur(radius: 3)
                .foregroundColor(.red)
        }
        
    }
}

struct ContentView2: View {
    var body: some View {
        VStack {
            Image("top_universe")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView3: View {
    var body: some View {
        VStack {
            
            List {
                ForEach(0 ..< 10) { _ in
                    HStack {
                        ForEach(0 ..< 3) { _ in
                            Image("bird")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
            }
            
        }
    }
}

struct ContentView4: View {
    
    @State private var img: UIImage? = nil
    let staticImage = UIImage(named: "cat")
    
    func imageDownloader() {
        guard let imgURL = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQb5KYk67CuvPE9f8t_s5ZWPb9FqTrbJ11Wi278n8_&s") else {
            print("Could not find images at this URL")
            return
        }
        
        URLSession.shared.dataTask(with: imgURL) { data, response, error in
            if let imageData = data, let imageToDisplay = UIImage(data: imageData) {
                self.img = imageToDisplay
            } else {
                print("error \(error?.localizedDescription)")
            }
        }
        .resume()
    }
    
    var body: some View {
        Image(uiImage: self.img ?? staticImage!)
            .resizable()
            .onAppear(perform: imageDownloader)
            .frame(width: CGFloat(400), height: CGFloat(400), alignment: .center)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView2()
            ContentView3()
            ContentView4()
        }
    }
}
