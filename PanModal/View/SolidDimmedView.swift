//
//  SolidDimmedView.swift
//  PanModal
//
//  Created by Himanshu Arora on 30/01/20.
//  Copyright © 2020 Detail. All rights reserved.
//

import UIKit

/**
 A dim view with solid color effect for use as an overlay over content you want dimmed.
 */
class SolidDimmedView: UIView, DimmedView {
    
    // MARK: - Properties
    var dimState: DimState = .off {
        didSet {
            switch dimState {
                case .max:
                    animator.fractionComplete = dimAlpha
                case .off:
                    animator.fractionComplete = 0.0
                case .percent(let percentage):
                    let val = max(0.0, min(1.0, percentage))
                    animator.fractionComplete = val * dimAlpha
            }
        }
    }
    
    var didTap: ((_ recognizer: UIGestureRecognizer) -> Void)?
    
    /**
     Tap gesture recognizer
     */
    private lazy var tapGesture: UIGestureRecognizer = {
        return UITapGestureRecognizer(target: self, action: #selector(didTapView))
    }()
    
    private let dimAlpha: CGFloat
    private var animator: UIViewPropertyAnimator!
    
    // MARK: - Initializers
    init(color: UIColor, alpha: CGFloat) {
        dimAlpha = alpha
        super.init(frame: .zero)
        animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear) {
            self.alpha = 1.0
        }
        backgroundColor = color
        self.alpha = 0.0
        addGestureRecognizer(tapGesture)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Deinitializer
    deinit {
        animator.stopAnimation(true)
    }
    
    // MARK: - Event Handlers
    @objc private func didTapView() {
        didTap?(tapGesture)
    }
    
}

