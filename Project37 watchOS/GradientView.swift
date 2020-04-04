//
//  GradientView.swift
//  Project37 watchOS
//
//  Created by Анастасия Стрекалова on 03.04.2020.
//  Copyright © 2020 Анастасия Стрекалова. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
    @IBInspectable var topColor: UIColor = .white
    @IBInspectable var bottomColor: UIColor = .black
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
    }
}
