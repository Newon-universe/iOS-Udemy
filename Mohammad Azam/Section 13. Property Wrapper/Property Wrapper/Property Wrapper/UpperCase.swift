//
//  UpperCase.swift
//  Property Wrapper
//
//  Created by Kim Yewon on 2022/09/27.
//

import Foundation

@propertyWrapper
class UpperCase {
    
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set {
            value = newValue
        }
    }
}


struct Driver {
    @UpperCase
    var license: String
    
    @UpperCase
    var state: String
}

extension Driver {
    init(license: String) {
        self.license = license
        self.state = "new"
    }
}

var driver = Driver(license: "ert-574")


print(driver.license) // ERT-574
print(driver.state) // NEW
