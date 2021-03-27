//
//  ThirdVCViewController.swift
//  Assignment
//
//  Created by Anmol Kalra on 27/03/21.
//

import UIKit

class ThirdVC: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var detailStack: UIStackView!
    @IBOutlet weak var detailStackTwo: UIStackView!
    @IBOutlet weak var walletParentStack: UIStackView!
    @IBOutlet weak var walletStack: UIStackView!
    @IBOutlet weak var nextButton: ButtonStyle!
    
    private let animation = Animation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.alpha = 0
        mainStack.alpha = 0
        detailStack.alpha = 0
        detailStackTwo.alpha = 0
        walletParentStack.alpha = 1
        walletStack.alpha = 0
        nextButton.alpha = 0
        
        nextButton.isUserInteractionEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.mainView.alpha = 1
            self.animation.fadeStackView(self.mainStack, type: 1)
            self.animation.fadeStackView(self.detailStack, type: 1)
            self.animation.fadeStackView(self.detailStackTwo, type: 1)
            self.animation.fadeStackView(self.walletParentStack, type: 1)
            self.animation.fadeStackView(self.walletStack, type: 1)
            self.animation.fadeButton(self.nextButton, type: 1)
            self.nextButton.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        DispatchQueue.main.async {
            self.animation.animateStackView(self.mainStack, x: -400, y: 0)
            self.animation.fadeButton(self.nextButton, type: 0)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.performSegue(withIdentifier: "screenFour", sender: self)
        }
    }
}
