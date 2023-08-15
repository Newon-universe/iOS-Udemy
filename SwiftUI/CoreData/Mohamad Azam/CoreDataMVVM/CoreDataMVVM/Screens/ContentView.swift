//
//  ContentView.swift
//  CoreDataMVVM
//
//  Created by Kim Yewon on 2023/08/14.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject private var budgetListVM: BudgetListViewModel
    
    @State private var isPresented: Bool = false
    
    init(vm: BudgetListViewModel) {
        self.budgetListVM = vm
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    ForEach(budgetListVM.budgets, id: \.id) { budget in
                        Text(budget.title)
                    }
                    .onDelete(perform: deleteBudget)
                }
                .listStyle(.plain)
            }
            .sheet(isPresented: $isPresented) {
                
            } content: {
                AddBudgetScreen(
                    vm: .init(context: CoreDataManager.shared.persistentStoreContainer.viewContext)
                )
            }
            .padding()
            .navigationTitle("Budets")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add New Budget") {
                        isPresented = true
                    }
                }
            }
        }
    }
    
    private func deleteBudget(at offsets: IndexSet) {
        offsets.forEach { index in
            let budget = budgetListVM.budgets[index]
            budgetListVM.deleteBudget(budgetId: budget.id)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
        
        ContentView(vm: BudgetListViewModel(context: viewContext))
    }
}
