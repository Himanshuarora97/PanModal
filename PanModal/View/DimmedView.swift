//
//  DimmedView.swift
//  PanModal
//
//  Copyright © 2017 Tiny Speck, Inc. All rights reserved.
//

#if os(iOS)
import UIKit

/**
 A dim view for use as an overlay over content you want dimmed.
 */


/**
 Represents the possible states of the dimmed view.
 max, off or a percentage of dimAlpha.
 */
public enum DimState {
    case max
    case off
    case percent(CGFloat)
}

// MARK: - Properties
public protocol DimmedView : UIView {
    /**
     The state of the dimmed view
     */
    
    var dimState: DimState { get set }
    
    /**
     The closure to be executed when a tap occurs
     */
    var didTap: ((_ recognizer: UIGestureRecognizer) -> Void)? { get set }
    
    
}
#endif
