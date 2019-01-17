
import UIKit

class ViewController: UIViewController {

    @IBOutlet var winningLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: Any) {
        activeGame = true
        
        
        
        //Player 1 is circle and Player 2 is x
        player = 1
        
        //0 = empty, 1 = circle, 2 = crosses
        gameBoard = [0,0,0,0,0,0,0,0,0]
        
        var button: UIButton
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: [])
            }
            winningLabel.isHidden = true
            playAgainButton.isHidden = true
        }
    }
    
    var activeGame = true
    
   
    
    //Player 1 is circle and Player 2 is x
    var player = 1
    
    //0 = empty, 1 = circle, 2 = crosses
    var gameBoard = [0,0,0,0,0,0,0,0,0]
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    @IBAction func ButtonCircle(_ sender: AnyObject) {
        var activePosition = sender.tag! - 1
        if gameBoard[activePosition] == 0 && activeGame{
            gameBoard[activePosition] = player
            if player == 1{
                sender.setImage(UIImage(named: "greencircle.png"), for :[])
                player = 2
                
            }else{
                sender.setImage(UIImage(named: "x.png"), for :[])
                player = 1
                
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
                
            }
        }
        
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winningLabel.isHidden = true
        playAgainButton.isHidden = true
        
        //winningLabel.center = CGPoint(x: self.winningLabel.center.x - 500, y: self.winningLabel.center.y)
        
    }


}



