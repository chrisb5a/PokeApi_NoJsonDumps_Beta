//
//  UIStackViewExtension.swift
//  JsonNew
//
//  Created by CHRISTIAN BEYNIS on 7/19/22.
//

import Foundation

import UIKit

extension UIStackView {
    
    
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: Distribution){
        
        self.init(frame : .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        
        
    }
    
    
}

