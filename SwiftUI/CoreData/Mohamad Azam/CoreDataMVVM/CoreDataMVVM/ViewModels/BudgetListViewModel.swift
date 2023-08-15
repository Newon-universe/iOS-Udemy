//
//  BudgetListViewModel.swift
//  CoreDataMVVM
//
//  Created by Kim Yewon on 2023/08/14.
//

import Foundation
import CoreData

@MainActor
class BudgetListViewModel: NSObject, ObservableObject {
    
    @Published var budgets = [BudgetViewModel]()
    private let fetchResultsController: NSFetchedResultsController<Budget>
    
    private (set) var context: NSManagedObjectContext
    init(context: NSManagedObjectContext) {
        self.context = context
        self.fetchResultsController = .init(
            fetchRequest: Budget.all,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        super.init()
        fetchResultsController.delegate = self
        
        do {
            try fetchResultsController.performFetch()
            guard let budgets = fetchResultsController.fetchedObjects else {
                return
            }
            self.budgets = budgets.map(BudgetViewModel.init)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteBudget(budgetId: NSManagedObjectID) {
        do {
            guard let budget = try context.existingObject(with: budgetId) as? Budget else {
                return
            }
            try budget.delete()
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension BudgetListViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let budgets = controller.fetchedObjects as? [Budget] else { return }
        self.budgets = budgets.map(BudgetViewModel.init)
    }
}


struct BudgetViewModel: Identifiable {
    private var budget: Budget
    
    init(budget: Budget) {
        self.budget = budget
    }
    
    var id: NSManagedObjectID {
        budget.objectID
    }
    
    var title: String {
        budget.title ?? ""
    }
    
    var total: Double {
        budget.total
    }
    
}
