//
//  TestViewController.swift
//  TestSystem
//
//  Created by Валерия Маслова on 16/06/2019.
//  Copyright © 2019 Shurumov Maxim. All rights reserved.
//

import UIKit
import RealmSwift

class TestViewController: UIViewController {

    var questions: Results<Question>!
    
    @IBOutlet weak var nameTestLabel: UILabel!
    @IBOutlet weak var numberQuestionLabel: UILabel!
    @IBOutlet weak var textQuestionLabel: UILabel!
    @IBOutlet weak var questionsTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    var currentTest: Test?
    var arrayQuestions: Array<String> = []
    var arrayAnswers: Array<Int> = []
    var userAnswers: Array<Int> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = realm.objects(Question.self)
        for question in questions {
            if  question.nameTest == currentTest!.nameTest {
                arrayQuestions.append(question.question)
                arrayAnswers.append(question.trueAns)
            }
        }


        backButton.isEnabled = false
        
        nameTestLabel.text = currentTest!.nameTest
        numberQuestionLabel.text = "1"
        textQuestionLabel.text = arrayQuestions[0]
        

        forwardButton.contentHorizontalAlignment = .right
        
        questionsTableView.layer.borderWidth = 1
        questionsTableView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func pastQuestion(_ sender: UIButton) {
        
        guard let indexPath = questionsTableView.indexPathForSelectedRow else {
            numberQuestionLabel.text = String(Int(numberQuestionLabel.text!)! - 1)
            
            if numberQuestionLabel.text == "1" {
                backButton.isEnabled = false
            }
            if String(arrayQuestions.count) != numberQuestionLabel.text {
                forwardButton.isEnabled = true
                forwardButton.setTitle("Вперёд", for: .normal)
            }
            userAnswers.append(-1)
            questionsTableView.reloadData()
            if userAnswers.count >= Int(numberQuestionLabel.text!)!
                && userAnswers[Int(numberQuestionLabel.text!)! - 1] != -1{
                let indexPathTrueAnswer = IndexPath(row: userAnswers[Int(numberQuestionLabel.text!)!  - 1],
                                                    section: 0)
                questionsTableView.selectRow(at: indexPathTrueAnswer, animated: true, scrollPosition: .middle)
            }
            return
            
        }
            if userAnswers.count == arrayQuestions.count - 1 {
                userAnswers.append(indexPath.row)
            } else if userAnswers.count >= Int(numberQuestionLabel.text!)! {
                userAnswers[Int(numberQuestionLabel.text!)! - 1] = indexPath.row
            } else {
                userAnswers.append(indexPath.row)
            }
        
        print(userAnswers[Int(numberQuestionLabel.text!)! - 1])
        numberQuestionLabel.text = String(Int(numberQuestionLabel.text!)! - 1)
        
        if numberQuestionLabel.text == "1" {
            backButton.isEnabled = false
        }
        if String(arrayQuestions.count) != numberQuestionLabel.text {
            forwardButton.isEnabled = true
            forwardButton.setTitle("Вперёд", for: .normal)
        }
        
        questionsTableView.reloadData()
        print(userAnswers[Int(numberQuestionLabel.text!)! - 1])
        if userAnswers.count >= Int(numberQuestionLabel.text!)!
            && userAnswers[Int(numberQuestionLabel.text!)! - 1] != -1{
            let indexPathTrueAnswer = IndexPath(row: userAnswers[Int(numberQuestionLabel.text!)!  - 1],
                                                section: 0)
            questionsTableView.selectRow(at: indexPathTrueAnswer, animated: true, scrollPosition: .middle)
        }
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
   
        
        guard let indexPath = questionsTableView.indexPathForSelectedRow else {     // Выбран ли индекс
            if(arrayQuestions.count == Int(numberQuestionLabel.text!)!) {
                performSegue(withIdentifier: "toTests", sender: nil)
                
            } else {                                                                       // Если нет
            numberQuestionLabel.text = String(Int(numberQuestionLabel.text!)! + 1)  // Прибавляем единицу
            
            if numberQuestionLabel.text != "1" {                                    // Если не первый вопрос, можно нажать кнопку "Назад"
                backButton.isEnabled = true
            }
            
            if String(arrayQuestions.count) == numberQuestionLabel.text {           // Если финальный вопрос
                                    // Изменяем кнопку "Вперед"
                forwardButton.setTitle("Закончить", for: .normal)
            }
            userAnswers.append(-1)                                                   // Добавляем, что ответа нет
            questionsTableView.reloadData()                                         // Обновляем таблицу
            if userAnswers.count >= Int(numberQuestionLabel.text!)!                     // Если количество ответов больше или равно номеру следующего вопроса
                && userAnswers[Int(numberQuestionLabel.text!)! - 1] != -1 {              // И ответ был дан
                let indexPathTrueAnswer = IndexPath(row: userAnswers[Int(numberQuestionLabel.text!)!  - 1],         // Изменяем
                    section: 0)
                questionsTableView.selectRow(at: indexPathTrueAnswer, animated: true, scrollPosition: .middle)
            }
            
            }
            return
            
        }
                                                                                    // Если индекс выбран
            
            if userAnswers.count >= Int(numberQuestionLabel.text!)!  {              // Если этот вопрос уже смотрели
                userAnswers[Int(numberQuestionLabel.text!)! - 1] = indexPath.row    // Да - изменияем

            } else {
                userAnswers.append(indexPath.row)                                   // Нет - добавляем
            }
        if(arrayQuestions.count == Int(numberQuestionLabel.text!)!) {
            performSegue(withIdentifier: "toTests", sender: nil)
        } else {
        numberQuestionLabel.text = String(Int(numberQuestionLabel.text!)! + 1)      // Прибавляем
        
        if numberQuestionLabel.text != "1" {
            backButton.isEnabled = true
        }
        
        if String(arrayQuestions.count) == numberQuestionLabel.text {

            forwardButton.setTitle("Закончить", for: .normal)
        }
        
        questionsTableView.reloadData()
        
        if userAnswers.count >= Int(numberQuestionLabel.text!)!                     // Если количество ответов больше или равно номеру следующего вопроса
            && userAnswers[Int(numberQuestionLabel.text!)! - 1] != -1 {              // И ответ был дан
            let indexPathTrueAnswer = IndexPath(row: userAnswers[Int(numberQuestionLabel.text!)!  - 1],         // Изменяем
                                                section: 0)
            questionsTableView.selectRow(at: indexPathTrueAnswer, animated: true, scrollPosition: .middle)
        }
    }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TestViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath)
    
    let numberQuestion = Int(numberQuestionLabel.text!)! - 1
    textQuestionLabel.text = arrayQuestions[numberQuestion]
    for question in questions {
        if question.question == arrayQuestions[numberQuestion] {
            if(indexPath.row == 0) {
                cell.textLabel!.text = question.ans1
            } else if indexPath.row == 1 {
                cell.textLabel!.text = question.ans2
            } else if indexPath.row == 2 {
                cell.textLabel!.text = question.ans3
            } else {
                cell.textLabel!.text = question.ans4
            }
        }
    }
    return cell
}

}

