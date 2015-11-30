//
//  Company+CoreDataProperties.swift
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

extension Company {

    @NSManaged var name: String?
    @NSManaged var address1: String?
    @NSManaged var address2: String?
    @NSManaged var address3: String?
    @NSManaged var telephone: String?
    @NSManaged var email: String?
    @NSManaged var people: NSSet?

}
