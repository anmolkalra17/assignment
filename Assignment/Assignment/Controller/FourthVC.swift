//
//  FourthVC.swift
//  Assignment
//
//  Created by Anmol Kalra on 27/03/21.
//

import UIKit

class FourthVC: UIViewController {

    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var labelStack: UIStackView!
    @IBOutlet weak var infoStack: UIStackView!
    @IBOutlet weak var confirmButton: ButtonStyle!
    
    private let animation = Animation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainStack.alpha = 0
        labelStack.alpha = 0
        infoStack.alpha = 0
        confirmButton.alpha = 0
        
        confirmButton.isUserInteractionEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.animation.fadeStackView(self.mainStack, type: 1)
            self.animation.fadeStackView(self.labelStack, type: 1)
            self.animation.fadeStackView(self.infoStack, type: 1)
            self.animation.fadeButton(self.confirmButton, type: 1)
            self.confirmButton.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func confirmButtonPressed(_ sender: UIButton) {
        print("Done")
    }
}
