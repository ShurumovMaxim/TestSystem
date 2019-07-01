//
//  TestModel.swift
//  TestSystem
//
//  Created by Валерия Маслова on 15/06/2019.
//  Copyright © 2019 Shurumov Maxim. All rights reserved.
//

import RealmSwift

class Test: Object {
    
    @objc dynamic var nameTest: String = ""
    @objc dynamic var level: String = ""
    
    convenience init(nameTest: String,
                     level: String) {
        self.init()
        self.nameTest = nameTest
        self.level = level
    }
    
}
