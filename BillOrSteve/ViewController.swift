//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var score = 0
    var binaryAnswer = 0
    var binaryAnswerName = 0
    var gameFacts: [String :[String]] = [:] //thanks xcode!
    var chosenPerson = ""
    var otherRandomPerson = ""
    var shownFact = ""
    
    @IBOutlet weak var keepScore: UILabel!
    @IBOutlet weak var infoBox: UILabel!
    
    @IBAction func clickSteve(sender: AnyObject) {
        if chosenPerson == "Steve Jobs" && score < 9  {
            score += 1
            keepScore.text = String(score)
            chosenPerson = randomPerson()
        }
   printFact()
    }
   
    @IBAction func clickBill(sender: AnyObject) {
    if chosenPerson == "Bill Gates" && score < 9 {
            score += 1
            keepScore.text = String(score)
            chosenPerson = randomPerson()
        }
        printFact()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        chosenPerson = randomPerson()
        printFact()
    }

    
    func createFacts() {
        gameFacts["Steve Jobs"] = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                                   "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                                   "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                                   "He was a pescetarian, meaning he ate no meat except for fish."]
        
        gameFacts["Bill Gates"] = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                                   "He scored 1590 (out of 1600) on his SATs.",
                                   "His foundation spends more on global health each year than the United Nation's World Health Organization", "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                                   "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
    }
   
    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func printFact() {
        let randomFact = getRandomFact()
        if let randomFact = randomFact {
            shownFact = randomFact.fact
            infoBox.text = randomFact.fact
            chosenPerson = randomFact.person
            
        }
    }
//    func areThereFacts(name: String) -> Bool {
//        if gameFacts[name]!.count > 0 {
//            return true
//        } else {
//            return false
//        }
//    }
    
    
        func getRandomFact() -> (fact: String, person: String)? {
            var strfacts = ""
            
            
                let factsCount = gameFacts[chosenPerson]!.count
                if factsCount !=  1{
                    binaryAnswer = randomNumberFromZeroTo(factsCount)
                } else {
                    binaryAnswer = 0
                }
            
            if let factChosen = gameFacts[chosenPerson]{
                if gameFacts[chosenPerson]!.count != 0{
                    strfacts = factChosen[binaryAnswer]
                }
            
            }
   
    return(strfacts, chosenPerson)
    }
    
    
    
    
    
    func randomPerson() -> String {
        let randomNumber = Int(arc4random_uniform(2))
        binaryAnswer = randomNumber
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
}

