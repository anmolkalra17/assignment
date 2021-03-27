//
//  AnimationMethods.swift
//  Assignment
//
//  Created by Anmol Kalra on 27/03/21.
//

import Foundation
import UIKit

class Animation{
    func animateView(_ outletViewName: UIView, x: CGFloat, y: CGFloat){
        let startX = outletViewName.frame.origin.x
        let startY = outletViewName.frame.origin.y
        let endX = startX + x
        let endY = startY + y
        UIView.animate(withDuration: 0.5) {
            outletViewName.frame.origin.x = endX
            outletViewName.frame.origin.y = endY
        }
    }

    func animateButton(_ outletButtonName: UIButton, x: CGFloat, y: CGFloat){
        let startX = outletButtonName.frame.origin.x
        let startY = outletButtonName.frame.origin.y
        let endX = startX + x
        let endY = startY + y
        UIButton.animate(withDuration: 0.5) {
            outletButtonName.frame.origin.x = endX
            outletButtonName.frame.origin.y = endY
        }
    }

    func animateLabel(_ outletLabelName: UILabel, x: CGFloat, y: CGFloat){
        let startX = outletLabelName.frame.origin.x
        let startY = outletLabelName.frame.origin.y
        let endX = startX + x
        let endY = startY + y
        UILabel.animate(withDuration: 0.5) {
            outletLabelName.frame.origin.x = endX
            outletLabelName.frame.origin.y = endY
        }
    }

    func animateStackView(_ outletStackName: UIStackView, x:CGFloat, y:CGFloat){
        let startX = outletStackName.frame.origin.x
        let startY = outletStackName.frame.origin.y
        let endX = startX + x
        let endY = startY + y
        UIStackView.animate(withDuration: 0.75) {
            outletStackName.frame.origin.x = endX
            outletStackName.frame.origin.y = endY
        }
    }

    func fadeView(_ outletName: UIView, type: Int){
        UIView.animate(withDuration: 0.5) {
            if type == 0{
                outletName.alpha = 0
            } else if type == 1{
                outletName.alpha = 1
            }
        }
    }

    func fadeButton(_ outletName: UIButton, type: Int){
        UIButton.animate(withDuration: 0.5) {
            if type == 0{
                outletName.alpha = 0
            } else if type == 1{
                outletName.alpha = 1
            }
        }
    }

    func fadeLabel(_ outletLabelName: UILabel, type: Int){
        UILabel.animate(withDuration: 0.5) {
            if type == 0{
                outletLabelName.alpha = 0
            } else if type == 1{
                outletLabelName.alpha = 1
            }
        }
    }

    func fadeStackView(_ outletStackViewName: UIStackView, type: Int){
        UIStackView.animate(withDuration: 0.5) {
            if type == 0{
                outletStackViewName.alpha = 0
            } else if type == 1{
                outletStackViewName.alpha = 1
            }
        }
    }

    func changeButtonText(_ outletButtonName: UIButton, text: String){
        UIButton.animate(withDuration: 0.5) {
            outletButtonName.setTitle(text, for: .normal)
        }
    }

    func changeLabelText(_ outletLabelText: UILabel, text: String){
        UILabel.animate(withDuration: 0.5) {
            outletLabelText.text = text
        }
    }

    func changeButtonWidth(_ button: UIButton, x:CGFloat){
        let oldWidth = button.frame.size.width
        UIButton.animate(withDuration: 0.5) {
            button.frame.size.width = oldWidth - x
        }
    }

    func changeButtonColor(_ button: UIButton){
        UIButton.animate(withDuration: 0.5) {
            button.backgroundColor = UIColor.systemOrange
        }
    }
}
