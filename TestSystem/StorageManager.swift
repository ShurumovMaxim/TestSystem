//
//  StorageManager.swift
//  TestSystem
//
//  Created by Валерия Маслова on 15/06/2019.
//  Copyright © 2019 Shurumov Maxim. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveUser(_ user: User) {
        try! realm.write {
            realm.add(user)
        }
    }
    
    static func deleteUser(_ user: User) {
        
        try! realm.write {
            realm.delete(user)
        }
    }

    static func saveTest(_ test: Test) {
        try! realm.write {
            realm.add(test)
        }
    }
    
    static func deleteUser(_ test: Test) {
        
        try! realm.write {
            realm.delete(test)
        }
    }
    static func saveQuestion(_ question: Question) {
        try! realm.write {
            realm.add(question)
        }
    }
    
    static func deleteQuestion(_ question: Question) {
        
        try! realm.write {
            realm.delete(question)
        }
    }
    static func saveResult(_ result: ResultsTest) {
        try! realm.write {
            realm.add(result)
        }
    }
    
    static func deleteResult(_ result: ResultsTest) {
        
        try! realm.write {
            realm.delete(result)
        }
    }
}
