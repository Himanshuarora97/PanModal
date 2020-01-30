//
//  PanModalBackgroundStyle.swift
//  PanModal
//
//  Created by Himanshu Arora on 30/01/20.
//  Copyright © 2020 Detail. All rights reserved.
//

import UIKit

/**
 An enum that defines the possible styles of the background of a pan modal container view.
 */
public enum PanModalBackgroundStyle: Equatable {
    
    /**
     Sets the backgound style to be the solid color effect with specified alpha.
     */
    case solid(color: UIColor, alpha: CGFloat)
    
    /**
     Sets the background style to be the blur effect
     with specified the blur style and degree.
     */
    case blur(style: UIBlurEffect.Style, degree: CGFloat)
    
    /**
     Sets the background style to be the custom effect
     specified by user.
     */
    
    public static func == (lhs: PanModalBackgroundStyle, rhs: PanModalBackgroundStyle) -> Bool {
        switch (lhs, rhs) {
            case let (.solid(lhsColor, lhsAlpha), .solid(rhsColor, rhsAlpha)):
                return lhsColor == rhsColor &&
                    lhsAlpha == rhsAlpha
            case let (.blur(lhsType, lhsDegree), .blur(rhsType, rhsDegree)):
                return lhsType == rhsType &&
                    lhsDegree == rhsDegree
            default:
                return false
        }
    }
    
}
