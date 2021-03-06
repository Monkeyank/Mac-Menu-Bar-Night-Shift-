//
//  CustomTimeWindowController.swift
//  Night-Shift
//
//  Created by Ankith on 2/29/20.
//  Copyright © 2020 Ankith. All rights reserved.
//

import Cocoa

class CustomTimeWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        guard let window = self.window else { return }
        window.level = .floating
        window.center()
    }

}
