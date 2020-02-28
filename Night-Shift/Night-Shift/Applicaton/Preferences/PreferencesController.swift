//
//  PreferencesController.swift
//  Night-Shift
//
//  Created by Ankith on 2/27/20.
//  Copyright © 2020 Ankith. All rights reserved.
//

import Cocoa

class PreferencesWindowController: NSWindowController {
    
    override func windowDidLoad() {
        super.windowDidLoad()
        guard let window = self.window else { return }
        window.styleMask = [.titled, .closable]
        window.center()
        window.title = "Preferences"
    }
    
}
