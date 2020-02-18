//
//  NightShiftSliderView.swift
//  Night-Shift
//
//  Created by Ankith on 2/18/20.
//  Copyright © 2020 Ankith. All rights reserved.
//

import Cocoa

class NightShiftSliderView: NSView {
    
    @IBOutlet weak var nightShiftSlider: NSSlider!
    
    func setup() {
        nightShiftSlider.isContinuous = true
        nightShiftSlider.minValue = 0
        nightShiftSlider.maxValue = 1
    }
    
    @IBAction func nightShiftSliderMoved(_ sender: NSSlider) {
        let event = NSApplication.shared.currentEvent
        
        if event?.type == .leftMouseUp {
            NightShift.blueLightReductionAmount = sender.floatValue
        } else {
            NightShift.previewBlueLightReductionAmount(sender.floatValue)
        }
    }
    
}
