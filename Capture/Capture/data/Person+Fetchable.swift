//
//  Person+Fetchable.swift
//  Capture
//
//  Created by WLD_MBP_20 on 12/11/2015.
//  Copyright © 2015 probert. All rights reserved.
//

import Foundation

extension Person : Fetchable {
    
    typealias FetchableType = Person
    
    static func entityName() -> String {
        return "Person"
    }
}