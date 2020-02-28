//
//  DimmerSliderView.swift
//  Night-Shift
//
//  Created by Ankith on 2/18/20.
//  Copyright © 2020 Ankith. All rights reserved.
//

import Cocoa

class DimmerSliderView: NSView {
    
    @IBOutlet weak var dimnessSlider: NSSlider!
    
    func setup() {
        dimnessSlider.isContinuous = true
        dimnessSlider.minValue = 0
        dimnessSlider.maxValue = 0.85
    }
    
    @IBAction func dimnessSliderMoved(_ sender: NSSlider) {
        let event = NSApplication.shared.currentEvent
        
        if event?.type == .leftMouseUp {
            Dimmer.previewDimnessStrength(sender.floatValue)
        } else {
            Dimmer.dimnessStrength = sender.floatValue
        }
    }
    
}
