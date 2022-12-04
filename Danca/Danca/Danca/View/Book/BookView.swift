//
//  BookView.swift
//  Danca
//
//  Created by Kim Yewon on 2022/11/17.
//

import SwiftUI

enum FocusingPage {
    case leftPage, rightPage
}

enum BookState {
    case close, open
}

struct BookView: View {
    
//    let section = Library.shared.loadBooks()[0].getAllSection()
    @State private var index = 0
    
    @State private var degreesRight: CGFloat = 0.0
    @State private var degreesCoverRight: CGFloat = 0.0
    
    @State private var degreesLeft: CGFloat = 0.0
    @State private var degreesCoverLeft: CGFloat = 0.0
    
    @State private var isLeftDrag = false
    @State private var isRightDrag = false
    
    @State private var focusing: FocusingPage = .leftPage
    
    //MARK: - 오른쪽 -> 완쪽으로 넘어가면, 이제 오른족이 왼쪽이 되도록
    //MARK: - 왼쪽 -> 오른쪽으로 넘어가면, 이제 왼쪽이 오른쪽이 되도록
    
    var body: some View {
        ZStack {
            Color(hex: 0xFFEDF2F2)
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { geo in
                HStack(alignment: .center, spacing: 0) {
                    ZStack {
                        //MARK: - LEFT COVER PAGE
                        Rectangle()
                            .fill(Color.green)
                            .cornerRadius(20, corners: [.topLeft, .bottomLeft])
                            .frame(width: geo.size.width / 2, height: geo.size.height)
                            .aspectRatio(contentMode: .fit)
                            .zIndex(-1)
                            .rotation3DEffect(
                                .degrees(degreesCoverLeft),
                                axis: (x: 0, y: 1, z: 0),
                                anchor: .trailing,
                                perspective: 0.15
                            )
                        
                        // 왼쪽은 페이지 기준 옆면만 보이면 되고
                        // 오른쪽은 아래랑 오른쪽이 보이면서

                        //MARK: - LEFT CONTENT PAGE
                        Rectangle()
                            .fill(Color.black)
                            .cornerRadius(20, corners: [.topLeft, .bottomLeft])
                            .frame(width: geo.size.width / 2, height: geo.size.height)
                            .aspectRatio(contentMode: .fit)
                            .overlay(
                                //MARK: - OVERLAY
                                ScrollViewReader { proxy in
                                    ScrollView(.vertical, showsIndicators: false) {
                                        VStack {
                                            HStack {
                                                Spacer()
                                                Text("Date 2022. 11. 10 (sun)")
                                                    .foregroundColor(.white)
                                            }
                                            
                                            Rectangle()
                                                .frame(height: 1)
                                                .foregroundColor(.white)
                                            
                                            HStack {
                                                VStack(alignment: .leading) {
                                                    Text("yesterday word")
                                                        .foregroundColor(.white)
                                                        .fontWeight(.heavy)
                                                    
                                                    HStack {
                                                        VStack(alignment: .leading) {
                                                            ForEach(SampleSections[index].words!) { word in
                                                                Text(word.studyWord)
                                                                    .foregroundColor(.white)
                                                            }
                                                        }
                                                        
                                                        VStack(alignment: .leading) {
                                                            ForEach(SampleSections[index].words!) { word in
                                                                Text(word.translatedWord)
                                                                    .foregroundColor(.white)
                                                                    .lineLimit(1)
                                                            }
                                                        }
                                                        .padding(.leading, 30)
                                                    }
                                                    .padding(.top, 15)
                                                }
                                            
                                                Spacer()
                                                
                                                VStack {
                                                    Text("Test")
                                                        .foregroundColor(.white)
                                                }
                                            }
                                        }
                                        .padding(30)
                                    }
                                }
                            )
                            .rotation3DEffect(
                                .degrees(degreesLeft + 2),
                                axis: (x: 0, y: 1, z: 0),
                                anchor: .trailing,
                                perspective: 0.15
                            )
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        if degreesLeft > 160 || degreesLeft < 2 {
                                            return
                                        }
                                        
                                        focusing = .leftPage
                                        isLeftDrag = true
                                        
                                        if isRightDrag && degreesLeft > 65 {
                                            return
                                        }
                                        
                                        let aCosValue = (value.translation.width * 4 / geo.size.width) * 180 / .pi
                                        
                                        withAnimation(.linear(duration: 0.1)) {
                                            degreesLeft = aCosValue
                                        }
                                        if isRightDrag {
                                            withAnimation(.linear(duration: 0.1)) {
                                                degreesCoverLeft = aCosValue
                                            }
                                        }
                                    }
                                    .onEnded { _ in
                                        isLeftDrag = false
                                        
                                        if degreesLeft < 70 {
                                            withAnimation(.linear(duration: 0.5)) {
                                                degreesLeft = 2
                                            }
                                        } else {
                                            withAnimation(.linear(duration: 0.5)) {
                                                degreesLeft = 178
                                            }
                                        }
                                        
                                        withAnimation(.linear(duration: 0.5)) {
                                            degreesCoverLeft = 0
                                        }
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.52) {
                                            degreesLeft = 2
                                        }
                                    }
                            )
                    }
                    .zIndex(focusing == .leftPage ? 1 : 0)

                    
                    // 각도는 2가지
                    // 1바퀴를 360도로 볼 것이냐
                    // 1바퀴를 2파이롭 볼 것이냐
                    // arc cos 함수는 각도를 아웃풋으로 -> 2파이를 내뱉어줌
                    // 이미지 애니메이션 각도는 1바퀴를 360도로 쓰고 있음
                    
                    // 지금 아이패드 화면하고 z 축 거리를 몇으로 줄 것이냐
                    // ProjectionTransform은 행렬의 역행렬 사용 중 ? --> cos 이나 sin 이 0 이 되는 순간은 transform 을 할 수 없어 --> 안할게?
                    
                    // 1. 드래그를 한번 시작하면 시작한 방향으로 돌아올지, 반대 방향으로 넘어갈지 정해서 돌아오게 해야함
                    
                    // 2. iPad 는 2D의 width 와 height 를 바꿔가면서 3D 이동을 구현한 "척" 하는 중, 따라서
                    // 이를 수행하고 있는 ProjectionTransform 에서 width 와 height 의 제한을 주면
                    // 넘어감이 끝까지 안나오고, 적절한 수준에서 컨트롤 할 수 있음.
                    
                    ZStack {
                        //MARK: - RIGHT CONTENT PAGE
                        Rectangle()
                            .fill(Color.blue)
                            .cornerRadius(20, corners: [.topRight, .bottomRight])
                            .frame(width: geo.size.width / 2, height: geo.size.height)
                            .aspectRatio(contentMode: .fit)
                            .rotation3DEffect(
                                .degrees(degreesRight - 2),
                                axis: (x: 0, y: 1, z: 0),
                                anchor: .leading,
                                anchorZ: 1,
                                perspective: 0.15
                            )
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        if degreesRight < -160 || degreesRight > 0 {
                                            return
                                        }
                                        
                                        focusing = .rightPage
                                        isRightDrag = true
                                        
                                        if isLeftDrag && degreesRight < -65 {
                                            return
                                        }
                                        
                                        let aCosValue = (value.translation.width * 4 / geo.size.width) * 180 / .pi
                                        
                                        withAnimation(.linear(duration: 0.1)) {
                                            degreesRight = aCosValue
                                        }
                                        
                                        if isLeftDrag {
                                            withAnimation(.linear(duration: 0.1)) {
                                                degreesCoverRight = aCosValue
                                            }
                                        }
                                        
                                    }
                                    .onEnded { _ in
                                        isRightDrag = false
                                        
                                        if degreesRight > -70 {
                                            withAnimation(.linear(duration: 0.5)) {
                                                degreesRight = -2
                                            }
                                        } else {
                                            withAnimation(.linear(duration: 0.5)) {
                                                degreesRight = -178
                                            }
                                        }
                                        
                                        withAnimation(.linear(duration: 0.5)) {
                                            degreesCoverRight = 0
                                        }
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.52) {
                                            degreesRight = -2
                                        }
                                    }
                            )
                        
                        //MARK: - RIGHT COVER PAGE
                        Rectangle()
                            .fill(Color.red)
                            .cornerRadius(20, corners: [.topRight, .bottomRight])
                            .frame(width: geo.size.width / 2, height: geo.size.height)
                            .aspectRatio(contentMode: .fit)
                            .rotation3DEffect(
                                .degrees(degreesCoverRight),
                                axis: (x: 0, y: 1, z: 0),
                                anchor: .leading,
                                anchorZ: 1,
                                perspective: 0.15
                            )
                            .zIndex(-1)
                    }//:ZStack
                    .zIndex(focusing == .rightPage ? 1 : 0)

                    
                }//: HStack
                .position(x: geo.size.width / 2, y: geo.size.height / 2)
            }
            .padding(40)
            .padding(.horizontal)
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

