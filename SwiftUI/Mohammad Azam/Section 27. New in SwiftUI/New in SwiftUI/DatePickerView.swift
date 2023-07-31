//
//  DatePicker.swift
//  New in SwiftUI
//
//  Created by Kim Yewon on 2022/09/29.
//

import SwiftUI

struct DatePickerView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        DatePicker("", selection: $selectedDate)
    }
}

struct DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
