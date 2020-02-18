//
//  DimmerSliderView.swift
//  Night-Shift
//
//  Created by Ankith on 2/18/20.
//  Copyright © 2020 Ankith. All rights reserved.
//

import Cocoa

class DimmerSliderView: NSView {
    
    @IBOutlet weak var dimmerSlider: NSSlider!
    
    func setup() {
        dimmerSlider.isContinuous = true
        dimmerSlider.minValue = 0
        dimmerSlider.maxValue = 0.85
    }
    
    @IBAction func dimmerSliderMoved(_ sender: NSSlider) {
        let event = NSApplication.shared.currentEvent
        
        if event?.type == .leftMouseUp {
            Dimmer.previewDimmerrStrength(sender.floatValue)
        } else {
            Dimmer.dimmerStrength = sender.floatValue
        }
    }
    
}
