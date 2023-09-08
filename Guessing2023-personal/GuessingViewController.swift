//
//  GuessingViewController.swift
//  Guessing2023-personal
//
//  Created by Tango Tew on 9/6/23.
//

import UIKit

class GuessingViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var guessInput: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBAction func tapDidHappened(_ sender: Any) {
        self.guessInput.resignFirstResponder()
    }
    
   
    
    @IBOutlet var mainView: UIView!
    
    var theme = "black"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //make sure we can take care of input callback by delegating this class to the textField
        guessInput.delegate = self
        //bring up keyboard right away
        self.guessInput.becomeFirstResponder()
        
        //set background color to black by default
        self.mainView.backgroundColor = UIColor.black
        
       
    }
    
    lazy var guessModel = Guessing()
    
    @IBAction func themeChanged(_ sender: UISegmentedControl) {
        switch sender.titleForSegment(at: sender.selectedSegmentIndex){
        case "green":
            self.mainView.backgroundColor = UIColor.green
        case "blue":
            self.mainView.backgroundColor = UIColor.blue
        default:
            self.mainView.backgroundColor = UIColor.black
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func guess(textInput: UITextField) -> Void{
        if let guess = textInput.text,
           let guessInt = Int(guess),
           guessInt >= guessModel.lowerBound(),
           guessInt <= guessModel.upperBound()
        {
            switch guessModel.makeGuess(guessInt){
            case GuessValueLower:
                self.outputLabel.text = "Go Higer!.."
                print("Go higher")
            case GuessValueHigher:
                self.outputLabel.text = "Go Lower!.."
                print("Go lower")
            default:
                self.outputLabel.text = "Yaaay!!! you won, The number is \(guessModel.lowerBound()).."
                print("Correct!")
                guessInput.resignFirstResponder()
            }
        }else{
            self.outputLabel.textColor = UIColor.red
            self.outputLabel.text = "Please Enter number between \(guessModel.lowerBound()) and \(guessModel.upperBound())"
            print("please enter number between \(guessModel.lowerBound()) and \(guessModel.upperBound())")
        }
    }
    @IBAction func guessNumber(_ sender: Any) {
        guess(textInput: self.guessInput)
        self.guessInput.text = ""
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
