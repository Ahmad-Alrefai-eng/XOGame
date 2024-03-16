//
//  ViewController.swift
//  XOgame
//
//  Created by Diamond on 16/03/2024.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var actionImg8: UIButton!
    @IBOutlet weak var actionImg7: UIButton!
    @IBOutlet weak var actionImg6: UIButton!
    @IBOutlet weak var actionImg5: UIButton!
    @IBOutlet weak var actionImg4: UIButton!
    @IBOutlet weak var actionImg3: UIButton!
    @IBOutlet weak var actionImg2: UIButton!
    @IBOutlet weak var actionImg: UIButton!
    @IBOutlet weak var actionImg1: UIButton!
    @IBOutlet weak var resultLbl: UILabel!
    var player : Int = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    var winning = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var isActive = true
    override func viewDidLoad() {
        super.viewDidLoad()
        backView.layer.cornerRadius = 10.0
        backView.layer.borderWidth = 1.0
        backView.layer.shadowRadius = 5;
      
       
         refrech()
    }
    @IBAction func playAgainBtb(_ sender: Any) {
         refrech()
    }


    @IBAction func actionBtn(_ sender: Any) {
        selectedPostion(button: sender as! UIButton)
    }

}

extension ViewController{
    func refrech(){
        actionImg.setImage(nil, for:  .normal)
        actionImg1.setImage(nil, for: .normal)
        actionImg2.setImage(nil, for: .normal)
        actionImg3.setImage(nil, for: .normal)
        actionImg4.setImage(nil, for: .normal)
        actionImg5.setImage(nil, for: .normal)
        actionImg6.setImage(nil, for: .normal)
        actionImg7.setImage(nil, for: .normal)
        actionImg8.setImage(nil, for: .normal)
        resultLbl.text = ""
        for i in 0...8 {
            gameState[i] = 0
        }
        isActive = true
    }
    func selectedPostion(button : UIButton){
        if isActive{
            if button.image(for: .normal) == nil {
                if player == 1 {
                    button.setImage(.xga, for: .normal)
                }else {
                    button.setImage(.o, for: .normal)
                }
                gameState[button.tag] = player
                checkWin()
                if player == 1{
                    player = 2
                }else {
                    player = 1
                }
            }
        }
    }
    func checkWin(){
        for i in winning{
            if gameState[i[0]] == gameState[i[1]]
            && gameState[i[1]] == gameState[i[2]]
                && gameState[i[2]] != 0 {
                resultLbl.text = "Winner is \(namePlayer())"
                isActive = false
            }
        }
    }
    func namePlayer() -> String{
        if player == 1 {
            return "X"
        }else {
            return "O"
        }
    }
}
