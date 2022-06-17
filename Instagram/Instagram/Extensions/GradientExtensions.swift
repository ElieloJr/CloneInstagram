//
//  GradientExtensions.swift
//  Instagram
//
//  Created by Usr_Prime on 24/05/22.
//

import Foundation
import UIKit

extension UIImage {
    // Posição do gradient [0.0, 0.1, 1.0, 1.1]
    
    static func gradientImage(bounds: CGRect, colors: [UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
}

extension UIView {
    func gradientBorder(with border: Int) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            UIColor(red: 0.90, green: 0.38, blue: 0.20, alpha: 1.00).cgColor,
            UIColor(red: 0.49, green: 0.29, blue: 0.73, alpha: 1.00).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)

        let shape = CAShapeLayer()
        shape.lineWidth = 3
        shape.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: CGFloat(border)).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        
        gradient.mask = shape

        self.layer.addSublayer(gradient)
    }
}
