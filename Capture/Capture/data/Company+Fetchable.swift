//
//  File.swift
//  Capture
//
//  Created by WLD_MBP_20 on 12/11/2015.
//  Copyright © 2015 probert. All rights reserved.
//

import Foundation

extension Company : Fetchable {
    
    typealias FetchableType = Company
    
    static func entityName() -> String {
        return "Company"
    }
}