//
//  ViewController.swift
//  ViewPractice
//
//  Created by Kim Yewon on 2022/07/06.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        // 서브뷰 생성
//        let frame = CGRect(x: 60, y: 100, width: 240, height: 120)
//        let subView = UIView(frame: frame)
//
//        // 서브뷰 색상
//        subView.backgroundColor = UIColor.green
//
//        // 서브뷰 추가하기
//        view.addSubview(subView)
//
//        // 서스뷰 삭제하기
//        view.removeFromSuperview()
        
        let viewRect = CGRect(x: 100, y: 100, width: 200, height: 200)
        let subView = UIView(frame: viewRect)
        subView.backgroundColor = UIColor.green
        
        
        print("서브뷰의 프레임의 CGRect : \(subView.frame)")
        print("서스뷰의 바운드의 CGRect: \(subView.bounds)")
        print("서브뷰의 프레임 Origin : \(subView.frame.origin)")
        print("서브뷰의 바운드 Origin : \(subView.bounds.origin)")
        
        self.view.addSubview(subView)
    }


}

