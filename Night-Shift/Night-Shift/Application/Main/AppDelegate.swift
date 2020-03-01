//
//  AppDelegate.swift
//  Night-Shift
//
//  Created by Ankith on 2/29/20.
//  Copyright © 2020 Ankith. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let dimnessWindow = DimnessWindowController()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        dimnessWindow.showWindow(nil)
        NightShift.blueLightReductionAmount = 0
        NightShift.enable()
    }
    
}
