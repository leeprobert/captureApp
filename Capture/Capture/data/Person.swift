//
//  Person.swift
//  Capture
//
//  Created by WLD_MBP_20 on 12/11/2015.
//  Copyright © 2015 probert. All rights reserved.
//

import Foundation
import CoreData

class Person: Record {
 
    convenience init(context:NSManagedObjectContext){
        
        let entityDescription = NSEntityDescription.entityForName(Person.entityName(), inManagedObjectContext: context)
        self.init(entity: entityDescription!, insertIntoManagedObjectContext: context)
    }
}
