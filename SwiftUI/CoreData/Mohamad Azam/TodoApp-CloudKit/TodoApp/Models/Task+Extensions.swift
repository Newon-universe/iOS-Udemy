//
//  Task+Extensions.swift
//  TodoApp
//
//  Created by Mohammad Azam on 4/1/21.
//

import Foundation
import CoreData

extension Task {
    
    // note: All of CloudKit models properties should be optional. or with default.
    // note2: When you want to use CloudKit with CoreData, should setup check "Used with CloudKit" in CONFIGURATIONS in CoreData Model file.
    // note3: In ToDoApp Project, Target, you should set up capability iColud, and check up CloudKit and choose Containers.
    // containers shoule be followed this format "iColud.com.~~~"
    
    func save() {
        do {
            try CoreDataManager.shared.viewContext.save()
        } catch {
            print("Unable to save task!")
        }
    }
    
    static func all() -> NSFetchRequest<Task> {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        return request
    }
    
}
