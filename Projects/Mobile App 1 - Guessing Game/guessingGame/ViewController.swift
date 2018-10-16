//
//  ViewController.swift
//  guessingGame
//
//  Created by Caleb Gideon Wright on 10/10/18.
//  Copyright © 2018 Caleb Gideon Wright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct animalStruct {
        var animalName = ""
        var animalString = ""
        var animalChoice = 0
    }
    
    var animalArray = [animalStruct]()
    var startHasBeenPressed = false
    

    @IBOutlet weak var instructionBox: UILabel!
    @IBOutlet weak var questionBox: UILabel!
    @IBOutlet weak var buttonOutlet: UIButton!
    var userString : String = ""
    var questionCounter = 1
    var guessing = false
    
    
    
    ////////// Buttons ////////////
   
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var unknownButton: UIButton!
    @IBOutlet weak var startOverOutlet: UIButton!
    
    @IBAction func startOverButton(_ sender: UIButton) {
        viewDidLoad()
        userString = ""
        questionCounter = 1
        guessing = false
        startOverOutlet.isHidden = true
        yesButton.isHidden = true
        noButton.isHidden = true
        unknownButton.isHidden = true
        buttonOutlet.isHidden = false
        questionBox.text = "Ready? Just press \("Start") to get started!"
    }
    @IBAction func startButton(_ sender: UIButton) {
        yesButton.isHidden = false
        noButton.isHidden = false
        unknownButton.isHidden = false
        buttonOutlet.isHidden = true
        questionCounter = changeQuestion(questionCounter: questionCounter)
    }
    
    @IBAction func pressYes(_ sender: UIButton) {
        if guessing == true{
            unknownButton.isHidden = true
            questionBox.text = "I WIN!"
            startOverOutlet.isHidden = false
            yesButton.isHidden = true
            noButton.isHidden = true
            guessing = false
            return
        }
        else {
            unknownButton.isHidden = false
        }
        userString += "1,"
        //questionCounter = questionCounter+1
        if questionCounter == 10{
            let guess = guessAnimal(userString: userString)
            print("Is your animal a \(guess)?")
            unknownButton.isHidden = true
            questionBox.text = "Is your animal a \(guess)?"
            guessing = true
            userString = ""
            questionCounter = 0
            return
        }
        questionCounter = questionCounter+1
        questionCounter = changeQuestion(questionCounter: questionCounter)
        //questionCounter = questionCounter+1
        print(userString)
    }
    @IBAction func pressNo(_ sender: UIButton) {
        if guessing == true{
            unknownButton.isHidden = true
            questionBox.text = "You WIN!, I couldn't guess the animal!"
            yesButton.isHidden = true
            noButton.isHidden = true
            startOverOutlet.isHidden = false
            guessing = false
            return
        }
        else{
            unknownButton.isHidden = false
        }
        userString += "0,"
        //questionCounter = questionCounter+1
        if questionCounter == 10{
//            print("entered the loop properly")
            let guess = guessAnimal(userString: userString)
            print("Is your animal a \(guess)?")
            unknownButton.isHidden = true
            questionBox.text = "Is your animal a \(guess)?"
            guessing = true
            userString = ""
            questionCounter = 0
            return
        }
        questionCounter = questionCounter+1
        questionCounter = changeQuestion(questionCounter: questionCounter)
        //questionCounter = questionCounter+1
        print(userString)
    }
    @IBAction func pressUnknown(_ sender: UIButton) {
        if guessing == true{
            unknownButton.isHidden = true
        }
        else{
            unknownButton.isHidden = false
        }
        userString += "u,"
        //questionCounter = questionCounter+1
        if questionCounter == 10{
            let guess = guessAnimal(userString: userString)
            print("Is your animal a \(guess)?")
            unknownButton.isHidden = true
            questionBox.text = "Is your animal a \(guess)?"
            guessing = true
            userString = ""
            questionCounter = 0
            return
        }
        questionCounter = questionCounter+1
        questionCounter = changeQuestion(questionCounter: questionCounter)
        //questionCounter = questionCounter+1
        print(userString)
    }
    func changeQuestion(questionCounter: Int) -> Int {
        let questionNumber = questionCounter
        if questionNumber == 1 {
            questionBox.text = "Is your animal heavier than an adult human?"
            unknownButton.isHidden = false
        }
        if questionNumber == 2{
            questionBox.text = "Is your animal furry (not feathery)?"
        }
        if questionNumber == 3{
            questionBox.text = "Is your animal aquatic, spending 50% of life or more in water?"
        }
        if questionNumber == 4{
            questionBox.text = "Is your animal some kind of bird?"
        }
        if questionNumber == 5{
            questionBox.text = "Is your animal something often sold in pet stores, or found on a farm?"
        }
        if questionNumber == 6{
            questionBox.text = "Would your animal primarily eat meat/other living things (if it were in the wild)?"
        }
        if questionNumber == 7{
            questionBox.text = "Would your animal be considered cat-like?"
        }
        if questionNumber == 8{
            questionBox.text = "Does your animal usually have a spotted pattern?"
        }
        if questionNumber == 9{
            questionBox.text = "Does your animal usually have a striped pattern?"
        }
        if questionNumber == 10{
            questionBox.text = "Does your animal have horns (not tusks)?"
        }
        if questionNumber == 11{
            guessing = true
            unknownButton.isHidden = true
        }
        //questionNumber = questionNumber + 1
        print("Question number is now: \(questionNumber)")
        return questionNumber
    }
    ///////////////////////////////
    func guessAnimal(userString: String) -> String {
        //var animalIndex = -1
        var lastAnimalScore = 0
        var lastAnimalIndex = 0
        var animalScore = 0
//        var holder = 0
        for i in 0...37{
            let animalName = animalArray[i].animalString
//            print("User string: \(userString), and animal name: \(animalName)")

            for j in 0...19{ // this loop will look through all 19 characters and determine how many of them are similar
//                print("checking \(userString) against \(animalName)")
//                if animalName.index(animalName.startIndex, offsetBy: j) == userString.index(userString.startIndex, offsetBy: j){
//                    print("\(animalName.index(animalName.startIndex, offsetBy: j)) is the same as \(userString.index(userString.startIndex, offsetBy: j))")
//                    animalScore = animalScore+1
//                    //print("Animal score is \(animalScore)")
//                }
                
                // I wanted to do what is above, but it wasn't working, so I made this workaround below
                
                let start = animalName.startIndex
                let end = animalName.index(start, offsetBy: j)
                let newCharacter = animalName[end]
                _ = userString.startIndex
                let endCheck = userString.index(start, offsetBy: j)
                let checkCharacter = userString[endCheck]
                
//                print("Comparing \(newCharacter) to \(checkCharacter)")
                if newCharacter == checkCharacter{
                    animalScore = animalScore+1
                }
                
//                print("holder value is \(j)")
                //holder = holder + 1
            }
            if animalScore > lastAnimalScore{
                lastAnimalScore = animalScore
                lastAnimalIndex = i
//                print("current animal selected: \(animalArray[i].animalName)")
                animalScore = 0;
            }
            if animalScore == lastAnimalScore{
                // check which animal is the preferred animal
            }
//            holder = 0
            animalScore = 0
        }
        print("The correct animal should be the \(animalArray[lastAnimalIndex].animalName)")
        print("testing: \(animalArray[12].animalName)")
        return animalArray[lastAnimalIndex].animalName
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOverOutlet.isHidden = true
        if startHasBeenPressed == false{
            yesButton.isHidden = true
            noButton.isHidden = true
            unknownButton.isHidden = true
            startHasBeenPressed = true
        }
        animalArray.append(animalStruct(animalName: "Dog", animalString: "0,1,0,0,1,1,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Cat", animalString: "0,1,0,0,1,1,1,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Lion", animalString: "1,1,0,0,0,1,1,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Elephant", animalString: "1,0,0,0,0,0,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Tiger", animalString: "1,1,0,0,0,1,1,0,1,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Horse", animalString: "1,1,0,0,1,0,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Bear", animalString: "1,1,0,0,0,1,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Monkey", animalString: "0,1,0,0,0,0,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Shark", animalString: "1,0,1,0,0,1,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Cheeta", animalString: "0,1,0,0,0,1,1,1,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Panda", animalString: "1,1,0,0,0,0,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Fish", animalString: "0,0,1,0,1,0,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Raccoon", animalString: "0,1,0,0,0,0,0,0,1,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Leopard", animalString: "0,1,0,0,0,1,1,1,0,0,", animalChoice: 2))
        animalArray.append(animalStruct(animalName: "Rabbit", animalString: "0,1,0,0,1,0,0,0,0,0,", animalChoice: 2))
        animalArray.append(animalStruct(animalName: "Cougar", animalString: "0,1,0,0,0,1,1,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Jellyfish", animalString: "0,0,1,0,0,1,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Snake", animalString: "0,0,u,0,1,1,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Rhino", animalString: "1,0,0,0,0,0,0,0,0,1,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Pig", animalString: "1,0,0,0,1,0,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Turtle", animalString: "0,0,1,0,1,0,0,0,0,0,", animalChoice: 2))
        animalArray.append(animalStruct(animalName: "Cow", animalString: "1,1,0,0,1,0,0,1,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Goat", animalString: "0,1,0,0,1,0,0,0,0,1,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Dolphin", animalString: "1,0,1,0,0,1,0,0,0,0,", animalChoice: 2))
        animalArray.append(animalStruct(animalName: "Deer", animalString: "1,1,0,0,0,0,0,0,0,1,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Squirrel", animalString: "0,1,0,0,0,0,0,0,0,0,", animalChoice: 2))
        animalArray.append(animalStruct(animalName: "Sheep", animalString: "0,1,0,0,1,0,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Wolf", animalString: "0,1,0,0,0,1,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Hippo", animalString: "1,0,1,0,0,0,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Donkey", animalString: "1,1,0,0,1,0,0,0,0,0,", animalChoice: 2))
        animalArray.append(animalStruct(animalName: "Whale", animalString: "1,0,1,0,0,1,0,0,0,0,", animalChoice: 4))
        animalArray.append(animalStruct(animalName: "Dinosaur", animalString: "1,0,0,0,0,1,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Crocodile", animalString: "1,0,1,0,0,1,0,0,0,0,", animalChoice: 3))
        animalArray.append(animalStruct(animalName: "Zebra", animalString: "1,1,0,0,0,0,0,0,1,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Giraffe", animalString: "1,1,0,0,0,0,0,1,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Penguin", animalString: "0,1,1,1,0,1,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Eagle", animalString: "0,0,0,1,0,1,0,0,0,0,", animalChoice: 1))
        animalArray.append(animalStruct(animalName: "Chicken", animalString: "0,0,0,1,1,1,0,0,0,0,", animalChoice: 1))
        
        
        
        /*for i in 0...37{
            print("Name: \(animalArray[i].animalName), String: \(animalArray[i].animalString)")
        }*/ // debugging tool to print out the whole array
        
        
        var count = 0
        for i in 0...37{
            for j in count...37{
                if animalArray[i].animalString == animalArray[j].animalString && animalArray[i].animalName != animalArray[j].animalName && animalArray[i].animalChoice == animalArray[j].animalChoice{
                    print("\(animalArray[i].animalName) has the same values as \(animalArray[j].animalName)")
                }
            }
            count = count+1
        } // another debugging tool to check whether animals were exactly the same, and to adjust the liklihood they would be picked.





// just some general formatting for stuff
        let radius : CGFloat = 10
        
        yesButton.layer.cornerRadius = radius
        yesButton.layer.borderColor = UIColor.black.cgColor
        yesButton.layer.borderWidth = 2
        
        noButton.layer.cornerRadius = radius
        noButton.layer.borderColor = UIColor.black.cgColor
        noButton.layer.borderWidth = 2
        
        unknownButton.layer.cornerRadius = radius
        unknownButton.layer.borderColor = UIColor.black.cgColor
        unknownButton.layer.borderWidth = 2
        
        instructionBox.layer.cornerRadius = radius
        instructionBox.layer.borderColor = UIColor.black.cgColor
        instructionBox.layer.borderWidth = 2
        
        questionBox.layer.cornerRadius = radius
        questionBox.layer.borderColor = UIColor.black.cgColor
        questionBox.layer.borderWidth = 2
        
        startOverOutlet.layer.cornerRadius = radius
        startOverOutlet.layer.borderColor = UIColor.black.cgColor
        startOverOutlet.layer.borderWidth = 2
        
        buttonOutlet.layer.cornerRadius = radius
        buttonOutlet.layer.borderColor = UIColor.black.cgColor
        buttonOutlet.layer.borderWidth = 2
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

