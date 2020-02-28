//
//  DimmerController.swift
//  Night-Shift
//
//  Created by Ankith on 2/27/20.
//  Copyright © 2020 Ankith. All rights reserved.
//

import Cocoa

class DimnessWindowController: NSWindowController {
    
    override func windowDidLoad() {
        super.windowDidLoad()
        guard let screen = NSScreen.main else { return }
        guard let window = self.window else { return }
        setup(window: window, frame: screen.frame)
    }
    
    func setup(window: NSWindow, frame: NSRect) {
        window.setFrame(frame, display: true)
        window.center()
        window.alphaValue = 0
        window.ignoresMouseEvents = true
        window.backgroundColor = .black
        window.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(.overlayWindow)))
        window.styleMask = [.fullScreen]
        window.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
    }
    
}

