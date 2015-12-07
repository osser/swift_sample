//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by xiaoma on 2015/12/07.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:コントロール
    @IBOutlet weak var rangeLbl: UILabel!;
    @IBOutlet weak var numberTxtField: UITextField!;
    @IBOutlet weak var messageLbl: UILabel!;
    @IBOutlet weak var numGuessesLbl: UILabel!;
    
    // MARK:変数
    private var lowerBound = 0;
    private var upperBound = 100;
    private var numGuesses = 0;
    private var secretNumber = 0;

    // MARK:システム関数
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        numberTxtField.becomeFirstResponder();
        reset();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:イベント

    @IBAction func onOkPressed(sender: UIButton){
        print(numberTxtField.text);
        let number = Int(numberTxtField.text!);
        if let number = number {
            selectedNumber(number);
        }else{
            let alert = UIAlertController(title: nil, message: "Enter a number", preferredStyle: .Alert);
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil));
            self.presentViewController(alert, animated: true, completion: nil);
        }
    }

    
}

// MARK:拡張機能
private extension ViewController {
    enum Comparison {
        case Smaller
        case Greater
        case Equals
    }
    
    func selectedNumber(number:Int){
        switch compareNumber(number, otherNumber: secretNumber){
        case .Equals:
            let alert = UIAlertController(title: nil, message: "You won in \(numGuesses) guesses!", preferredStyle: .Alert);
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { cmd in
                self.reset();
                self.numberTxtField.text = "";
            }));
            self.presentViewController(alert, animated: true, completion: nil);
            break;
        case .Smaller:
            lowerBound = max(lowerBound, number);
            messageLbl.text = "Your last guess war too low.";
            numberTxtField.text = "";
            numGuesses++;
            renderRange();
            renderNumGuesses();
            break;
        case .Greater:
            upperBound = min(upperBound, number);
            messageLbl.text = "Your last guess was too high.";
            numberTxtField.text = "";
            numGuesses++;
            renderRange();
            renderNumGuesses();
            break;
            
        }
    }
    
    func compareNumber(number: Int, otherNumber: Int) -> Comparison {
        if number < otherNumber {
            return .Smaller;
        }else if number > otherNumber {
            return .Greater;
        }
        return .Equals;
    }
}

private extension ViewController {
    func extractSecretNumber(){
        let diff = upperBound - lowerBound;
        let randomNumber = Int(arc4random_uniform(UInt32(diff)));
        secretNumber = randomNumber + Int(lowerBound);
    }
    
    func renderRange(){
        rangeLbl.text = "\(lowerBound) and \(upperBound)";
    }
    
    func renderNumGuesses(){
        numGuessesLbl.text = "Number of Guesses: \(numGuesses)";
    }
    
    func resetData(){
        lowerBound = 0;
        upperBound = 100;
        numGuesses = 0;
    }
    
    func resetMsg(){
        messageLbl.text = "";
    }
    
    func reset(){
        resetData();
        renderRange();
        renderNumGuesses();
        extractSecretNumber();
        resetMsg();
    }
}
