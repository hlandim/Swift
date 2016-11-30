//
//  ViewController.swift
//  JogoDaVelha
//
//  Created by Hugo Landim Santos on 23/11/16.
//  Copyright © 2016 Hugo Landim Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var viewMsg: UIView!
    var container: ContainerController!
    
    @IBOutlet var wonLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ContainerController, segue.identifier == "containerButtons" {

            container = vc
            container.setOnPlayWon(handler: showPlayerWonLabel)
        }
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func playAgainClicked(_ sender: Any) {
        container.resetBoard()
        hidePlayerWonLabel()
    }
    func hidePlayerWonLabel() {
        if(viewMsg != nil) {
            viewMsg.alpha = 1
            UIView.animate(withDuration: 0.7, animations: {
                self.viewMsg.alpha = 0
//                self.wonLabel.text = "Jogo da velha"
            })
        }
//        let newX = self.view.frame.width * -1
//        if(containerMsg != nil) {
//            wonLabel.text = ""
//            containerMsg.center = CGPoint(x: newX/2 , y: containerMsg.center.y)
//        }
//        playAgainButton.alpha = 0
//        if(playAgainButton != nil) {
//            playAgainButton.center = CGPoint(x: newX/2 , y: playAgainButton.center.y)
//        }
//        
    }
    
    func showPlayerWonLabel(player: String){
        wonLabel.text = "\(player) venceu!"
        if(viewMsg != nil) {
            viewMsg.alpha = 0
            UIView.animate(withDuration: 0.7, animations: {
                self.viewMsg.alpha = 1
            })
        }
        
//        UIView.animate(withDuration: 0.7, animations: {
//            let newX = self.playAgainButton.center.x / -1
//            self.playAgainButton.center = CGPoint(x: newX, y: self.playAgainButton.center.y)
//            self.playAgainButton.alpha = 1
//        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

