//
//  ViewController.swift
//  Dice
//
//  Created by Claudia Cavalini Maganhi on 14/04/20.
//  Copyright © 2020 Claudia Cavalini Maganhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!
    @IBOutlet weak var buttonContainerView: UIView!
    
    var dices: [UIImage] = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyRoundCorner()
        rollTheDice()
    }
    
    private func applyRoundCorner() {
        buttonContainerView.layer.cornerRadius = 8.0
        buttonContainerView.layer.masksToBounds = true
    }
    
    @IBAction func roll(_ sender: UIButton) {
        rollTheDice()
    }
    
    private func rollTheDice() {
        dicesAnimation()
        let randomNumber = Int.random(in: 0...dices.count - 1)
        rightDiceImageView.image = dices[randomNumber]
        dices.shuffle()
        leftDiceImageView.image = dices[randomNumber]
    }
    
    private func dicesAnimation() {
        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = Double.pi * 2
        rotation.duration = 0.1
        rotation.isCumulative = true
        rotation.repeatCount = 5
        leftDiceImageView.layer.add(rotation, forKey: "rotationAnimation")
        rightDiceImageView.layer.add(rotation, forKey: "rotationAnimation")
    }
    
}

