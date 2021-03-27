//
//  SecondVC.swift
//  Assignment
//
//  Created by Anmol Kalra on 27/03/21.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var stackViewMain: UIStackView!
    @IBOutlet weak var imageStack: UIStackView!
    @IBOutlet weak var labelStack: UIStackView!
    @IBOutlet weak var nextButton: ButtonStyle!
    
    private let animation = Animation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackViewMain.alpha = 0
        imageStack.alpha = 0
        labelStack.alpha = 0
        nextButton.alpha = 0
        nextButton.isUserInteractionEnabled = false
        mainView.alpha = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.mainView.alpha = 1
            self.animation.fadeStackView(self.stackViewMain, type: 1)
            self.animation.fadeStackView(self.imageStack, type: 1)
            self.animation.fadeStackView(self.labelStack, type: 1)
            self.animation.fadeButton(self.nextButton, type: 1)
            self.nextButton
                .isUserInteractionEnabled = true
        }
    }

    @IBAction func nextButton(_ sender: UIButton) {
        
        DispatchQueue.main.async {
            self.animation.animateStackView(self.stackViewMain, x: -400, y: 0)
            self.animation.fadeButton(self.nextButton, type: 0)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.performSegue(withIdentifier: "screenThree", sender: self)
        }
    }
}
