//
//  Fade.swift
//  Night-Shift
//
//  Created by Ankith on 2/29/20.
//  Copyright © 2020 Ankith. All rights reserved.
//

import Cocoa

public extension NSWindow {
    
    typealias AnimationCompletionHandler = () -> Void
    typealias desiredAlpha = () -> CGFloat
    
    func fadeInNew(duration: Double, completionHandler: AnimationCompletionHandler? = nil) {
        StateManager.isFadeInAnimationActive = true
        Dimness.isDimnessEnabled = true
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = duration
            animator().alphaValue = CGFloat(Dimness.getStrengthBeforeDisable())
        }, completionHandler: {
            StateManager.isFadeInAnimationActive = false
            completionHandler?()
        })
    }
    
    func fadeOutNew(duration: Double, completionHandler: AnimationCompletionHandler? = nil) {
        Dimness.setStrengthBeforeDisable(strength: alphaValue)
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = duration
            animator().alphaValue = 0
        }, completionHandler: {
            if !StateManager.isFadeInAnimationActive {
                Dimness.isDimnessEnabled = false
            }
            completionHandler?()
        })
    }
    
}
