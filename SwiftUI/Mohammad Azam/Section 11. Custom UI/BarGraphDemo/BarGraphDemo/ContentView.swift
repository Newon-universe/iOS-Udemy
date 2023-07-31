//
//  ContentView.swift
//  BarGraphDemo
//
//  Created by Kim Yewon on 2022/09/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BarGraph(reports: Report.all())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
