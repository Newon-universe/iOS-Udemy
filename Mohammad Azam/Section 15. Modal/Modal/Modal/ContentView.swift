//
//  ContentView.swift
//  Modal
//
//  Created by Kim Yewon on 2022/09/28.
//

import SwiftUI

struct ContentView: View {
    
    @State var flagVM = FlagViewModel()
    let flags = ["🇰🇷","🇨🇦","🇫🇷","🇨🇭","🇺🇸","🇮🇹","🇬🇧","🇨🇿"]
    
    
    var body: some View {
        
        List {
            
            Text(self.flagVM.country)
            
            ForEach(self.flags, id: \.self) { flag in
                HStack {
                    Text(flag)
                        .font(.custom("Arial", size: 100))
                    Spacer()
                }.onTapGesture {
                    flagVM.flag = flag
                    flagVM.showModal.toggle()
                }
            }
        }
        .sheet(isPresented: self.$flagVM.showModal) {
            FlagDetailView(flagVM: $flagVM)
        }
    
//        Button {
//            showModal.toggle()
//        } label: {
//            Text("Show Modal")
//        }
//        .sheet(isPresented: $showModal) {
//
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
