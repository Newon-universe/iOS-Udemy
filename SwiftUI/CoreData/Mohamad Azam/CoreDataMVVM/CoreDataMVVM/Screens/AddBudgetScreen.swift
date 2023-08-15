//
//  AddBudgetScreen.swift
//  CoreDataMVVM
//
//  Created by Kim Yewon on 2023/08/14.
//

import SwiftUI

struct AddBudgetScreen: View {
    
    @ObservedObject var vm: AddBudgetViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(vm: AddBudgetViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        Form {
            TextField("Enter title", text: $vm.name)
            TextField("Enter total", text: $vm.total)
            
            Button("Save") {
                vm.save()
                presentationMode.wrappedValue.dismiss()
            }
            .centerHorizontally()
            .navigationTitle("Add New Budget")
        }
    }
}

struct AddBudgetScreen_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
        NavigationView {
            AddBudgetScreen(vm: AddBudgetViewModel(context: viewContext))
        }
    }
}
