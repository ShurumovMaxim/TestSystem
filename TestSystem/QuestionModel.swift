//
//  QuestionModel.swift
//  TestSystem
//
//  Created by Валерия Маслова on 15/06/2019.
//  Copyright © 2019 Shurumov Maxim. All rights reserved.
//

import RealmSwift

class Question: Object {
    
    @objc dynamic var nameTest: String = ""
    @objc dynamic var question: String = ""
    @objc dynamic var ans1: String = ""
    @objc dynamic var ans2: String = ""
    @objc dynamic var ans3: String = ""
    @objc dynamic var ans4: String = ""
    @objc dynamic var trueAns: Int = 0
    
    convenience init(nameTest: String,
                     question: String,
                     ans1: String,
                     ans2: String,
                     ans3: String,
                     ans4: String,
                     trueAns: Int) {
        
        self.init()
        self.nameTest = nameTest
        self.question = question
        self.ans1 = ans1
        self.ans2 = ans2
        self.ans3 = ans3
        self.ans4 = ans4
        self.trueAns = trueAns
    }
    
}
