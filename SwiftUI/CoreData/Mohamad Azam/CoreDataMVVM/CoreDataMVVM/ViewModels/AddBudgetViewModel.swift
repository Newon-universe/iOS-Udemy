//
//  AddBudgetViewModel.swift
//  CoreDataMVVM
//
//  Created by Kim Yewon on 2023/08/14.
//

import Foundation
import CoreData

class AddBudgetViewModel: ObservableObject {
    var context: NSManagedObjectContext
    
    @Published var name: String = ""
    @Published var total: String = ""
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save() {
        do {
            let budget = Budget(context: context)
            budget.title = name
            budget.total = Double(total) ?? 0
            try budget.save()
        } catch {
            print(error)
        }
    }
}
