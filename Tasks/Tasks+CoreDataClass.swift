//
//  Tasks+CoreDataClass.swift
//  Tasks
//
//  Created by Jasmine Tan on 7/23/18.
//  Copyright © 2018 Jasmine Tan. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Tasks)
public class Tasks: NSManagedObject {

    convenience init?(task: String?, text: String?){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        self.init(entity: Tasks.entity(), insertInto: managedContext)
        self.task = task
        self.text = text
        
    }

}
