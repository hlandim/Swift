//
//  ContainerController.swift
//  JogoDaVelha
//
//  Created by Hugo Landim Santos on 25/11/16.
//  Copyright © 2016 Hugo Landim Santos. All rights reserved.
//

import UIKit

class ContainerController: ViewController {
    
    var firstPlayer = true
    var firstPlayerMoves: Array = [Int]()
    var secondPlayerMoves: Array = [Int]()
    var onPlayerWon: ((String) -> ())? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetBoard(){
        firstPlayerMoves = [Int]()
        secondPlayerMoves = [Int]()
        firstPlayer = true
        for view in self.view.subviews as [UIView] {
            if let btn = view as? UIButton {
                btn.setBackgroundImage(nil, for: .normal)
            }
        }
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        
        let btnNumber = sender.tag
        if !firstPlayerMoves.contains(btnNumber) && !secondPlayerMoves.contains(btnNumber) {
            
            if firstPlayer {
                let image = UIImage(named: "cross") as UIImage?
                sender.setBackgroundImage(image, for: .normal)
                firstPlayerMoves.append(btnNumber)
                if won(moves: firstPlayerMoves) {
                    playerWon(name: "Jogador 1")
                    return
                }
            } else {
                let image = UIImage(named: "nought") as UIImage?
                sender.setBackgroundImage(image, for: .normal)
                secondPlayerMoves.append(btnNumber)
                if won(moves: secondPlayerMoves) {
                    playerWon(name: "Jogador 2")
                    return
                }
            }
            firstPlayer = !firstPlayer
        }
    }
    
    func playerWon(name:String) {
        if self.onPlayerWon != nil{
            self.onPlayerWon!(name)
        }
    }
    
    func won(moves: Array<Int>) -> Bool {
        
        var movesToCheck = [0,1,2]
        // Horizontais
        if ( checkMoves(movesChecks: movesToCheck, moves: moves) ){
            return true
        }
        movesToCheck = [3,4,5]
        if ( checkMoves(movesChecks: movesToCheck, moves: moves) ){
            return true
        }
        movesToCheck = [6,7,8]
        if ( checkMoves(movesChecks: movesToCheck, moves: moves) ){
            return true
        }
        // Verticais
        movesToCheck = [0,3,6]
        if ( checkMoves(movesChecks: movesToCheck, moves: moves) ){
            return true
        }
        movesToCheck = [1,4,7]
        if ( checkMoves(movesChecks: movesToCheck, moves: moves) ){
            return true
        }
        movesToCheck = [2,5,8]
        if ( checkMoves(movesChecks: movesToCheck, moves: moves) ){
            return true
        }
        // Diagonais
        movesToCheck = [0,4,8]
        if ( checkMoves(movesChecks: movesToCheck, moves: moves) ){
            return true
        }
        movesToCheck = [2,4,6]
        if ( checkMoves(movesChecks: movesToCheck, moves: moves) ){
            return true
        }
        return false
    }
    
    func checkMoves(movesChecks:[Int], moves:[Int]) -> Bool {
        for move in movesChecks {
            if !moves.contains(move) {
                return false
            }
        }
        paintMoves(moves: movesChecks)
        return true
    }
    
    func paintMoves(moves:[Int]) {
        let imageName = firstPlayer ? "cross_blue" : "nought_blue"
        let image = UIImage(named: imageName) as UIImage?
//        for move in moves {
//            if let tmpButton = self.view.viewWithTag(move) as? UIButton {
//                tmpButton.setBackgroundImage(image, for: .normal)
//            }
//        }
        for view in self.view.subviews as [UIView] {
            if let btn = view as? UIButton {
                if moves.contains(btn.tag) {
                    btn.setBackgroundImage(image, for: .normal)
                }
            }
        }
    }
    
    func setOnPlayWon(handler:@escaping (String) -> ()){
        self.onPlayerWon = handler
    }

}
