//
//  BaseModel+Extensions.swift
//  CoreDataMVVM
//
//  Created by Kim Yewon on 2023/08/14.
//

import Foundation
import CoreData

extension Budget: BaseModel {
    
    static var all: NSFetchRequest<Budget> {
        let request = Budget.fetchRequest()
        request.sortDescriptors = []
        return request
    }
    
}
