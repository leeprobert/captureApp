//
//  Record+CoreDataProperties.swift
//  Capture
//
//  Created by WLD_MBP_20 on 12/11/2015.
//  Copyright © 2015 probert. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Record {

    @NSManaged var isFlaggedForSync: NSNumber?
    @NSManaged var timestamp: NSDate?

}
