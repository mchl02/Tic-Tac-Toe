//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Matthew Lee on 1/13/19.
//  Copyright © 2019 Matthew Lee. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet var winningLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    
    @IBOutlet var MySwitch: UISwitch!
    @IBAction func switchToggled(_ sender: UISwitch) {
        changeWrapper()
    }
    
    func changeWrapper() {
        if MySwitch.isOn {
            switchS = true
            print("OH it worked!")
        } else {
            switchS = false
        }
    }
    @IBAction func playAgain(_ sender: Any) {
        activeGame = true
        
        
        
        //Player 1 is circle and Player 2 is x
        player = 1
        
        //0 = empty, 1 = circle, 2 = crosses
        gameBoard = [0,0,0,0,0,0,0,0,0]
        playAgainButton.isHidden = true
        winningLabel.isHidden = true
        var button: UIButton
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: [])
            }
            
        }
    }
    var switchS = false
    
    var activeGame = true
    
   
    
    //Player 1 is circle and Player 2 is x
    var player = 1
    
    //0 = empty, 1 = circle, 2 = crosses
    var gameBoard = [0,0,0,0,0,0,0,0,0]
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    @IBAction func ButtonCircle(_ sender: AnyObject) {
        var activePosition = sender.tag! - 1
        if gameBoard[activePosition] == 0 && activeGame{
            if switchS{
                if player == 1{
                    
                    if arc4random_uniform(9) < 7{
                        var number = Int.random(in: 1 ..< 10)
                        let buttons = view.viewWithTag(number) as? UIButton
                        buttons?.setImage(UIImage(named: "greencircle.png"), for :[])
                        gameBoard[number-1] = player
                        player = 2
                        print(gameBoard)
                    }else{
                        sender.setImage(UIImage(named: "greencircle.png"), for :[])
                        gameBoard[activePosition] = player
                        player = 2
                        print(gameBoard)
                    }
                    
                    
                }else{
                    if arc4random_uniform(9) < 7{
                        var number1 = Int.random(in: 1 ..< 9)
                        let buttons = view.viewWithTag(number1) as? UIButton
                        buttons?.setImage(UIImage(named: "x.png"), for :[])
                        gameBoard[number1-1] = player
                        print(gameBoard)
                        
                        player = 1
                    }else{
                        sender.setImage(UIImage(named: "x.png"), for :[])
                        gameBoard[activePosition] = player
                        player = 1
                        print(gameBoard)
                    }
                }
            }
            else{
                gameBoard[activePosition] = player
                if player == 1{
                    sender.setImage(UIImage(named: "greencircle.png"), for :[])
                    player = 2
                    
                }else{
                    sender.setImage(UIImage(named: "x.png"), for :[])
                    player = 1
                    
                }
                   
            }
            for combination in winningCombinations{
                if gameBoard[combination[0]] != 0 && gameBoard[combination[0]] == gameBoard[combination[1]] && gameBoard[combination[1]] == gameBoard[combination[2]]{
                    //There is a winner
                    activeGame = false
                    
                    winningLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameBoard[combination[0]] == 1{
                        winningLabel.text = "Player 1 has won"
                    }else{
                        winningLabel.text = "Player 2 has won"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winningLabel.center = CGPoint(x: self.winningLabel.center.x, y: self.winningLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x, y:self.playAgainButton.center.y)
                    })
                }
                
                activeGame = false
                
                for i in gameBoard
                {
                    if i == 0
                    {
                        activeGame = true
                        break
                    }
                }
                
                if activeGame == false
                {
                    winningLabel.isHidden = false
                    
                    playAgainButton.isHidden = false
                    winningLabel.text = "     It is a draw"
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winningLabel.center = CGPoint(x: self.winningLabel.center.x, y: self.winningLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x, y:self.playAgainButton.center.y)
                    })
                }
            }
            
        }
        
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winningLabel.isHidden = true
        playAgainButton.isHidden = true
        MySwitch.transform = CGAffineTransform(scaleX: 2, y: 2)
        //winningLabel.center = CGPoint(x: self.winningLabel.center.x - 500, y: self.winningLabel.center.y)
        
    }


}


