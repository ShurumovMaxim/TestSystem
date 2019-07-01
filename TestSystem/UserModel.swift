//
//  UserModel.swift
//  TestSystem
//
//  Created by Валерия Маслова on 15/06/2019.
//  Copyright © 2019 Shurumov Maxim. All rights reserved.
//

import RealmSwift

class User: Object {
    
    @objc dynamic var photoUser: Data?
    @objc dynamic var login: String = ""
    @objc dynamic var pass: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var secondName: String = ""
    @objc dynamic var level: String = "Junior"

    
    convenience init(photoUser: Data?,
                     login: String,
                     pass: String,
                     name: String,
                     secondName: String,
                     level: String) {
        self.init()
        self.photoUser = photoUser
        self.login = login
        self.pass = pass
        self.name = name
        self.secondName = secondName
        self.level = level
    }
    
}

