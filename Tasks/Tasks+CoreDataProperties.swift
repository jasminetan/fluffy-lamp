//
//  Tasks+CoreDataProperties.swift
//  Tasks
//
//  Created by Jasmine Tan on 7/23/18.
//  Copyright © 2018 Jasmine Tan. All rights reserved.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var task: String?
    @NSManaged public var text: String?

}
