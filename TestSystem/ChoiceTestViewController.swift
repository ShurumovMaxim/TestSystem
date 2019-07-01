//
//  ChoiceTestViewController.swift
//  TestSystem
//
//  Created by Валерия Маслова on 15/06/2019.
//  Copyright © 2019 Shurumov Maxim. All rights reserved.
//

import UIKit
import RealmSwift
class ChoiceTestViewController: UIViewController {

    var tests: Results<Test>!
    var results: Results<ResultsTest>!
    var questions: Results<Question>!

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var levelSegmentedControl: UISegmentedControl!
    @IBOutlet weak var testTableView: UITableView!
    
    var currentUser: User?
    var arrayTest: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tests = realm.objects(Test.self)
        results = realm.objects(ResultsTest.self)
        questions = realm.objects(Question.self)

        //addTests()
        //addTestsAgain()
        photoImage.image = UIImage(data: currentUser!.photoUser!)
        photoImage.layer.cornerRadius = (photoImage.frame.size.height + 1) / 2
        photoImage.clipsToBounds = true
        photoImage.layer.borderWidth = 1
        photoImage.layer.borderColor = UIColor.black.cgColor
        
        let fullName = currentUser!.name + " " + currentUser!.secondName
        nameButton.setTitle(fullName, for: .normal)
        nameButton.contentHorizontalAlignment = .left
        
        levelLabel.text = currentUser!.level
        
        testTableView.layer.borderWidth = 1
        testTableView.layer.borderColor = UIColor.black.cgColor
        
        if currentUser!.level != "Senior" {
            levelSegmentedControl.setEnabled(false, forSegmentAt: 2)
        }
        
        if  currentUser!.level == "Junior" {
            levelSegmentedControl.setEnabled(false, forSegmentAt: 1)
        }
    }
    
    @IBAction func choiceLevel(_ sender: UISegmentedControl) {
        testTableView.reloadData()
    }
    
    @IBAction func changeName(_ sender: UIButton) {
        performSegue(withIdentifier: "changeName", sender: nil)
    }
    func addTestsAgain() {
        let test = Test()
        let question = Question()
        
        test.nameTest = "Функции Swift"
        test.level = "Junior"
        
        saveEveryTest(test: test)
        
        question.nameTest = "Функции Swift"
        question.question = "Как обозначаются функции в Swift?"
        question.ans1 = "func"
        question.ans2 = "void"
        question.ans3 = "function"
        question.ans4 = "define"
        question.trueAns = 1
        
        saveEveryQuestion(question: question)
        
        question.nameTest = "Функции Swift"
        question.question = "Какое минимальное количество праметров можно передать в функцию?"
        question.ans1 = "Один"
        question.ans2 = "Два"
        question.ans3 = "Три"
        question.ans4 = "Ни одного"
        question.trueAns = 4
        
        saveEveryQuestion(question: question)
        
        test.nameTest = "ООП"
        test.level = "Middle"
        
        saveEveryTest(test: test)
        
        question.nameTest = "ООП"
        question.question = "Сокрытие данных - это ..."
        question.ans1 = "Полиморфизм"
        question.ans2 = "Инкапсуляция"
        question.ans3 = "Инверсия"
        question.ans4 = "Наследование"
        question.trueAns = 2
        
        saveEveryQuestion(question: question)
        print("!!!")
        question.nameTest = "ООП"
        question.question = "Создание нового объекта на основании старого - это ..."
        question.ans1 = "Полиморфизм"
        question.ans2 = "Абстракция"
        question.ans3 = "Наследование"
        question.ans4 = "Инкапсуляция"
        question.trueAns = 3
        
    }
    
    func addTests() {
        
        let test = Test()
        let question = Question()
        
        test.nameTest = "Основы Swift"
        test.level = "Junior"
        
        saveEveryTest(test: test)

        question.nameTest = "Основы Swift"
        question.question = "Как обозначается константа в Swift?"
        question.ans1 = "let"
        question.ans2 = "var"
        question.ans3 = "const"
        question.ans4 = "define"
        question.trueAns = 1
        
         saveEveryQuestion(question: question)
print("!!!")
        question.nameTest = "Основы Swift"
        question.question = "Как обозначается переменная в Swift?"
        question.ans1 = "let"
        question.ans2 = "var"
        question.ans3 = "const"
        question.ans4 = "define"
        question.trueAns = 2
        
         saveEveryQuestion(question: question)
        print("!!!")
        question.nameTest = "Основы Swift"
        question.question = "Фреймворк, отвечающий за UI элементы?"
        question.ans1 = "RealmSwift"
        question.ans2 = "HealthKit"
        question.ans3 = "UIKit"
        question.ans4 = "Foundation"
        question.trueAns = 3
        
         saveEveryQuestion(question: question)
        
        question.nameTest = "Основы Swift"
        question.question = "Фреймворк, отвечающий стандартные функции?"
        question.ans1 = "RealmSwift"
        question.ans2 = "HealthKit"
        question.ans3 = "UIKit"
        question.ans4 = "Foundation"
        question.trueAns = 4
        
         saveEveryQuestion(question: question)
        
        question.nameTest = "Основы Swift"
        question.question = "Фреймворк, отвечающий за базы данных?"
        question.ans1 = "RealmSwift"
        question.ans2 = "HealthKit"
        question.ans3 = "UIKit"
        question.ans4 = "Foundation"
        question.trueAns = 1
        
         saveEveryQuestion(question: question)
        print("!!!")
        test.nameTest = "UIKit Swift"
        test.level = "Junior"
        
        saveEveryTest(test: test)
        
        question.nameTest = "UIKit Swift"
        question.question = "Для чего служет Label?"
        question.ans1 = "Для вывода текста на экране"
        question.ans2 = "Это кнопка"
        question.ans3 = "Таблица со значениями"
        question.ans4 = "Выбор из диапазона"
        question.trueAns = 1
        
         saveEveryQuestion(question: question)
        
        question.nameTest = "UIKit Swift"
        question.question = "Для чего служет Button?"
        question.ans1 = "Для вывода текста на экране"
        question.ans2 = "Это кнопка"
        question.ans3 = "Таблица со значениями"
        question.ans4 = "Выбор из диапазона"
        question.trueAns = 2
        
         saveEveryQuestion(question: question)
        print("!!!")
        test.nameTest = "Коллекции в Swift"
        test.level = "Middle"
        
        saveEveryTest(test: test)
        
        question.nameTest = "Коллекции в Swift"
        question.question = "Что относится к коллекциям?"
        question.ans1 = "Dictionary"
        question.ans2 = "Set"
        question.ans3 = "Array"
        question.ans4 = "Все выше перечисленные"
        question.trueAns = 4
        
         saveEveryQuestion(question: question)
        
        question.nameTest = "Коллекции в Swift"
        question.question = "Как обозначается словарь в Swift?"
        question.ans1 = "Dictionary"
        question.ans2 = "Set"
        question.ans3 = "Array"
        question.ans4 = "Ни один из выше перечисленные"
        question.trueAns = 1
        
         saveEveryQuestion(question: question)
        
        question.nameTest = "Коллекции в Swift"
        question.question = "Как обозначается массив в Swift?"
        question.ans1 = "Dictionary"
        question.ans2 = "Set"
        question.ans3 = "Array"
        question.ans4 = "Ни один из выше перечисленные"
        question.trueAns = 3
        
         saveEveryQuestion(question: question)
        
        question.nameTest = "Коллекции в Swift"
        question.question = "Как обозначается множество в Swift?"
        question.ans1 = "Dictionary"
        question.ans2 = "Set"
        question.ans3 = "Array"
        question.ans4 = "Ни один из выше перечисленные"
        question.trueAns = 2
        
         saveEveryQuestion(question: question)
print("!!!")
        
        test.nameTest = "Базы данных в Swift"
        test.level = "Senior"
        
        saveEveryTest(test: test)
        
        question.nameTest = "Базы данных в Swift"
        question.question = "Что из перечисленного является потоком для отображения реальных результатов в Realm?"
        question.ans1 = "Stream"
        question.ans2 = "Steam"
        question.ans3 = "Results"
        question.ans4 = "Objects"
        question.trueAns = 3
        
         saveEveryQuestion(question: question)
        
        question.nameTest = "Базы данных в Swift"
        question.question = "Какой метод обязателен для  UITableView?"
        question.ans1 = "Количество ячеек в таблице"
        question.ans2 = "Значений каждой ячейки"
        question.ans3 = "Оба метода"
        question.ans4 = "Ни один не нужен"
        question.trueAns = 3
        
        saveEveryQuestion(question: question)
        
        
    }
    
    func updateLevel(level: String) {
        var countTest = 0
        var countSucTest = 0
        
        for test in tests {
            
            if test.level == level {
                countTest += 1
                var countQuestions = 0
                
                for question in questions {
                    if question.nameTest == test.nameTest {
                        countQuestions += 1
                    }
                }
                
                for result in results {
                    if result.login == currentUser!.login &&
                        result.nameTest == test.nameTest &&
                        (Double(result.mark) / Double(countQuestions)) > 0.5 {
                        countSucTest += 1
                    }
                }
            }
        }

        if countTest == countSucTest {
            if level == "Junior" {
                try! realm.write {
                    currentUser!.level = "Middle"
                }
                levelLabel.text = currentUser!.level
                levelSegmentedControl.setEnabled(true, forSegmentAt: 1)
            }
            else {
                try! realm.write {
                    currentUser!.level = "Senior"
                }
                levelLabel.text = currentUser!.level
                levelSegmentedControl.setEnabled(true, forSegmentAt: 2)
            }
        }
    }
    
    func saveEveryQuestion(question: Question) {
        let newQuestion = Question(nameTest: question.nameTest,
                                   question: question.question,
                                   ans1: question.ans1,
                                   ans2: question.ans2,
                                   ans3: question.ans3,
                                   ans4: question.ans4,
                                   trueAns: question.trueAns)
        StorageManager.saveQuestion(newQuestion)
    }
    
    func saveEveryTest(test: Test) {
        let newTest = Test(nameTest: test.nameTest, level: test.level)
        StorageManager.saveTest(newTest)
    }
    
    // MARK: - Navigation

    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        if segue.identifier == "toChoiceTest" {
            guard let data = currentUser!.photoUser, let image = UIImage(data: data) else { return }
            
            photoImage.image = image
            let fullName = currentUser!.name + " " + currentUser!.secondName
            nameButton.setTitle(fullName, for: .normal)
        }

        if segue.identifier == "toTests" {
            guard let testVC = segue.source as? TestViewController else { return }
            var mark = 0
            for (index, answer) in testVC.userAnswers.enumerated() {

                if answer == testVC.arrayAnswers[index] - 1 {
                    mark += 1
                }
            }
            
            if results.isEmpty {
                let newResult = ResultsTest(login: currentUser!.login,
                                            nameTest: testVC.currentTest!.nameTest,
                                            mark: mark)
                StorageManager.saveResult(newResult)
            }
            
            var count = 0
            
            for result in results {
                count += 1
                if result.login == currentUser!.login &&
                    result.nameTest == testVC.currentTest!.nameTest &&
                    result.mark < mark {
                    try! realm.write {
                        result.mark = mark
                    }
                    break
                }
                count += 1
            }
            
            if count == results.count {
                let newResult = ResultsTest(login: currentUser!.login,
                                            nameTest: testVC.currentTest!.nameTest,
                                            mark: mark)
                StorageManager.saveResult(newResult)
            }
            testTableView.reloadData()
            updateLevel(level: "Junior")
            updateLevel(level: "Middle")
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeName"  {
            let registrVC = segue.destination as! RegistrationViewController
            
            registrVC.currentUser = currentUser
       
        }
        if segue.identifier == "toQuestions" {
            let testVC = segue.destination as! TestViewController
            
            guard let indexPath = testTableView.indexPathForSelectedRow else { return }
            let cell = testTableView.cellForRow(at: indexPath) as! TestCell
            for test in tests {
                if test.nameTest == cell.nameTestLabel.text {
                    testVC.currentTest = test
                    break
                }
            }
        }

    }

}

extension ChoiceTestViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countTests = 0
        arrayTest.removeAll()
        var level = "Junior"
        
        if levelSegmentedControl.selectedSegmentIndex == 2 {
            level = "Senior"
        } else if levelSegmentedControl.selectedSegmentIndex == 1 {
            level = "Middle"
        }
        if tests.isEmpty == false {
            for test in tests {
                if test.level == level {
                    countTests += 1
                    arrayTest.append(test.nameTest)
                }
            }
        }
        return countTests
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as! TestCell
        var test = Test()
        
        for nowTest in tests {
            if(nowTest.nameTest == arrayTest[indexPath.row]) {
                test = nowTest
            }
        }


        cell.nameTestLabel.text = test.nameTest
        
        var countQuestions = 0
        for question in questions {
            if question.nameTest == test.nameTest {
                countQuestions += 1
            }
        }
        
        if results.isEmpty {
            let result = ResultsTest(login: currentUser!.login, nameTest: test.nameTest, mark: 0)
            try! realm.write {
                realm.add(result)
            }
            cell.markLabel.text = "0/" + String(countQuestions)
            let resultIcon = #imageLiteral(resourceName: "information")
            cell.resultImage.image = resultIcon
        } else {
            var flagFind = false
            for result in results {
                if(result.login == currentUser!.login && result.nameTest == test.nameTest) {
                    cell.markLabel.text = String(result.mark) + "/" + String(countQuestions)
                    flagFind = true
                    if result.mark == 0 {
                        let resultIcon = #imageLiteral(resourceName: "information")
                        cell.resultImage.image = resultIcon
                    } else if (Double(result.mark) / Double(countQuestions)) > 0.5 {
                        let resultIcon = #imageLiteral(resourceName: "like")
                        cell.resultImage.image = resultIcon
                    } else {
                        let resultIcon = #imageLiteral(resourceName: "dislike")
                        cell.resultImage.image = resultIcon
                    }
                }
            }
            if(flagFind == false) {
                let result = ResultsTest(login: currentUser!.login, nameTest: test.nameTest, mark: 0)
                try! realm.write {
                    realm.add(result)
                }
                cell.markLabel.text = String(result.mark) + "/" + String(countQuestions)
                let resultIcon = #imageLiteral(resourceName: "information")
                cell.resultImage.image = resultIcon
            }
        }
        
        return cell
    }

}
