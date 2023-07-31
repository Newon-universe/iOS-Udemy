//
//  UrlEncode.swift
//  Property Wrapper
//
//  Created by Kim Yewon on 2022/09/27.
//

import Foundation

@propertyWrapper
class UrlEncode {
    
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set {
            if let url = newValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                self.value = url
            }
        }
    }
}

struct Resource {
    @UrlEncode
    var city: String
    
    var url: String {
        city
    }
}

var resource = Resource(city: "Los Angelos")
print(resource.city)

print(resource.url)
