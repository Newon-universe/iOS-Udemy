//
//  HomeView.swift
//  Danca
//
//  Created by Kim Yewon on 2022/11/05.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        BookList()
    }
}

struct BookList: View {
    var book: [Book] = Library().loadBooks()
    @State private var selectedBook: Int? = nil
    @State private var isSelected: Bool = false
    @State private var selectedSection: [Section]? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                HomeBackgroundView()
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 35) {
                            NavigationLink(isActive: $isSelected) {
//                                    BookView(section: selectedSection)
                                BookView()
                            } label: {
                                EmptyView()
                            }//: NavigationLink
                            
                            ForEach(book.indices, id:\.self) { index in
                                book[index].coverImage
                                    .resizable()
                                    .frame(
                                        width: selectedBook == index ? 350 : 300,
                                        height: selectedBook == index ? 450 : 400
                                    )
                                    .cornerRadius(10)
                                    .shadow(
                                        color: .gray,
                                        radius: 10,
                                        x: 3,
                                        y: 0
                                    )
                                    .id(index)
                                    .onTapGesture {
                                        self.selectedSection = book[index].getAllSection()
                                        
                                        if selectedBook != index {
                                            withAnimation {
                                                proxy.scrollTo(index, anchor: .center)
                                                selectedBook = index
                                            }
                                        } else {
                                            isSelected = true
                                        }
                                    }
                            }//: ForEach
                        }//: HStack
                        .padding(.leading, 130)
                    }//: ScrollView
                    .padding(.horizontal, 30)
                }//: ScrollViewReader
            }//: ZStack
        }//: NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

private struct HomeBackgroundView: View {
    var body: some View {
        ZStack {
            Color(hex: 0xFFEdF2F2)
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { geo in
                Circle()
                    .position(x: 0, y: geo.size.height / 2)
                    .foregroundColor(.error)
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
