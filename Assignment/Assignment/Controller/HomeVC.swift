//
//  ViewController.swift
//  Assignment
//
//  Created by Anmol Kalra on 26/03/21.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: - Home Outlets
    
    @IBOutlet weak var cardOneButton: ButtonStyle!
    @IBOutlet weak var cardTwoView: ViewStyle!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var cardOneView: ViewStyle!
    @IBOutlet weak var crossButton: ButtonStyle!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var downloadButton: ButtonStyle!
    
    //MARK: - Preview Outlets
    @IBOutlet weak var previewMain: UIView!
    @IBOutlet weak var previewText: UILabel!
    @IBOutlet weak var previewButton: UIButton!
    @IBOutlet weak var previewStackView: UIStackView!
    
    private var flag = 0
    private var i = 0.0
    private var timer = Timer()
    private let animation = Animation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previewMain.isHidden = true
        
        crossButton.alpha = 0
        closeButton.alpha = 0
        previewText.alpha = 0
        previewButton.alpha = 0
        previewStackView.alpha = 0
        
        crossButton.isUserInteractionEnabled = false
        closeButton.isUserInteractionEnabled = false
        downloadButton.isUserInteractionEnabled = false
        previewButton.isUserInteractionEnabled = false
    }
    //MARK: - CardOne Trigger
    
    @IBAction func cardOneTapped(_ sender: UIButton) {
        print("Card One Triggered")
        if flag == 0{
            flag += 1
        }
        print(flag)
        
        if flag == 1{
            DispatchQueue.main.async {
                self.closeButton.isUserInteractionEnabled = true
                self.downloadButton.isUserInteractionEnabled = true
                self.crossButton.isUserInteractionEnabled = true
                
                self.animation.animateView(self.cardOneView, x: -15, y: -64)
                self.animation.animateButton(self.downloadButton, x: 0, y: 275)
                self.animation.animateButton(self.crossButton, x: 0, y: 300)
                self.animation.animateLabel(self.mainLabel, x: -10, y: 30)
                
                self.cardOneButton.backgroundColor = UIColor.clear
                self.animation.fadeView(self.cardTwoView, type: 0)
                self.cardOneButton.isUserInteractionEnabled = false
                
                self.animation.fadeButton(self.closeButton, type: 1)
                
//                UIButton.performWithoutAnimation {
//                    self.mainLabel.text = "CANDY\nBUST"
//                    self.downloadButton.setTitle("DOWNLOAD 30MB", for: .normal)
//                }
                
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                self.previewMain.isHidden = false
                
                self.animation.fadeLabel(self.previewText, type: 1)
                self.animation.fadeButton(self.previewButton, type: 1)
                self.animation.animateStackView(self.previewStackView, x: -344, y: 300)
                self.animation.fadeStackView(self.previewStackView, type: 1)
            }
        }
    }
    
    //MARK: - CloseButton Trigger
    
    @IBAction func closeTapped(_ sender: UIButton) {
        print("Close Triggered")
        if flag == 1{
            flag -= 1
        }
        print(flag)
        
        DispatchQueue.main.async {
            
            self.closeButton.isUserInteractionEnabled = false
            self.crossButton.isUserInteractionEnabled = false
            
            
            self.animation.animateView(self.cardOneView, x: 0, y: 0)
            self.animation.animateButton(self.downloadButton, x: 0, y: 0)
            self.animation.animateButton(self.crossButton, x: 0, y: 0)
            self.animation.animateLabel(self.mainLabel, x: 0, y: 0)
            self.animation.changeButtonColor(self.cardOneButton)
            
            
            self.cardOneButton.isUserInteractionEnabled = true
            self.crossButton.isUserInteractionEnabled = false
            
            self.animation.fadeView(self.cardTwoView, type: 1)
            self.animation.fadeButton(self.closeButton, type: 0)
            self.animation.fadeButton(self.crossButton, type: 0)
            
            self.previewMain.isHidden = true
            
            self.animation.fadeLabel(self.previewText, type: 0)
            self.animation.fadeButton(self.previewButton, type: 0)
            self.animation.animateStackView(self.previewStackView, x: 344, y: -300)
            
            self.animation.changeButtonText(self.downloadButton, text: "")
            
        }
    }
    
    //MARK: - CrossButton Trigger
    
    @IBAction func crossTapped(_ sender: UIButton) {
        print("Yellow Cross Triggered")
    }
    
    //MARK: - DownloadButton Trigger
    
    @IBAction func downloadTapped(_ sender: UIButton) {
        print("Download Triggered")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.performSegue(withIdentifier: "screenTwo", sender: self)
        }
    }
}
