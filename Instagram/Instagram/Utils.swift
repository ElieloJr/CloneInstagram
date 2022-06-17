//
//  Utils.swift
//  Instagram
//
//  Created by Usr_Prime on 23/05/22.
//

import UIKit

class Titles {
    static let feedTitle = "Instagram"
    static let activityTitle = "Atividade"
    static let toMeetTitle = "Conhecer"
    static let postTitle = "Post"
    
    static func userName(_ name: String) -> String{
        return name
    }
    
    static let feedFont = [NSAttributedString.Key.font: UIFont(name: "Noteworthy-Bold", size: 24)!]
    static let defaultFont = [NSAttributedString.Key.font: UIFont(name: "Noteworthy-Bold", size: 26)!]
}

class Colors {
    static let defautBackground = UIColor.systemBackground
    static let defaultBlue = UIColor(red: 0.00, green: 0.58, blue: 0.96, alpha: 1.00)
    
    // MARK: To gradient
    static let gradientBottomLeft = UIColor.yellow
    static let gradientTopLeft = UIColor(red: 0.90, green: 0.38, blue: 0.20, alpha: 1.00)
    static let gradientTopRight = UIColor(red: 0.49, green: 0.29, blue: 0.73, alpha: 1.00)
}

class Add {
    static func gradientBorder(with view: UIView, border: Int) {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: -2, y: -2, width: view.frame.width+17, height: view.frame.width+17)
        gradient.colors = [
            Colors.gradientBottomLeft.cgColor,
            Colors.gradientTopLeft.cgColor,
            Colors.gradientTopRight.cgColor
        ]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)

        let shape = CAShapeLayer()
        shape.lineWidth = 4
        shape.path = UIBezierPath(roundedRect: CGRect(x: 3,
                                                      y: 3,
                                                      width: view.frame.width-3,
                                                      height: view.frame.width-3),
                                  cornerRadius: CGFloat(border)).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        
        gradient.mask = shape
        
        view.layer.addSublayer(gradient)
    }
}
