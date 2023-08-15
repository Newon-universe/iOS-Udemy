//
//  Photo.swift
//  CoreDataImage
//
//  Created by Kim Yewon on 2023/08/15.
//

import Foundation
import CoreData
import UIKit

@objc(Photo)
class Photo: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var content: UIImage?
    @NSManaged public var title: String?

}

extension Photo: Identifiable {

}
