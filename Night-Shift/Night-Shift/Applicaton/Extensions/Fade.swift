//
//  Fade.swift
//  Night-Shift
//
//  Created by Ankith on 2/27/20.
//  Copyright © 2020 Ankith. All rights reserved.
//

import Cocoa

public extension NSWindow {
    
    typealias AnimationCompletionHandler = () -> Void
    typealias desiredAlpha = () -> CGFloat
    
    func fadeInNew(duration: Double, completionHandler: AnimationCompletionHandler? = nil) {
        States.isFadeInAnimationActive = true
        Dimmer.isDimnessEnabled = true
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = duration
            animator().alphaValue = CGFloat(Dimmer.getStrengthBeforeDisable())
        }, completionHandler: {
            States.isFadeInAnimationActive = false
            completionHandler?()
        })
    }
    
    func fadeOutNew(duration: Double, completionHandler: AnimationCompletionHandler? = nil) {
        Dimmer.setStrengthBeforeDisable(strength: alphaValue)
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = duration
            animator().alphaValue = 0
        }, completionHandler: {
            // Prevents race condition during animations when Nocturnal is disabled and then enabled in quick succession
            if !States.isFadeInAnimationActive {
                Dimmer.isDimnessEnabled = false
            }
            completionHandler?()
        })
    }
    
}
