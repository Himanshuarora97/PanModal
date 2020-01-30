//
//  BlurDimmedView.swift
//  PanModal
//
//  Created by Himanshu Arora on 30/01/20.
//  Copyright © 2020 Detail. All rights reserved.
//

import UIKit

/**
 A dim view with blur effect for use as an overlay over content you want dimmed.
 */
@available(iOS 10.0, *)
class BlurDimmedView: UIVisualEffectView, DimmedView {
    
    // MARK: - Properties
    var dimState: DimState = .off {
        didSet {
            switch dimState {
                case .max:
                    animator.fractionComplete = blurDegree
                case .off:
                    animator.fractionComplete = 0.0
                case .percent(let percentage):
                    let val = max(0.0, min(1.0, percentage))
                    animator.fractionComplete = val * blurDegree
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
    
    private let blurDegree: CGFloat
    private var animator: UIViewPropertyAnimator!
    
    // MARK: - Initializers
    init(style: UIBlurEffect.Style, degree: CGFloat) {
        self.blurDegree = degree
        super.init(effect: nil)
        animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear) {
            self.effect = UIBlurEffect(style: style)
        }
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
