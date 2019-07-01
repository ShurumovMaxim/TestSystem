//
//  ResultsTest.swift
//  TestSystem
//
//  Created by Валерия Маслова on 15/06/2019.
//  Copyright © 2019 Shurumov Maxim. All rights reserved.
//

import RealmSwift

class ResultsTest: Object {
    
    @objc dynamic var login: String = ""
    @objc dynamic var nameTest: String = ""
    @objc dynamic var mark: Int = 0
    
    convenience init(login: String,
                     nameTest: String,
                     mark: Int) {
        self.init()
        self.login = login
        self.nameTest = nameTest
        self.mark = mark
    }
    
}
