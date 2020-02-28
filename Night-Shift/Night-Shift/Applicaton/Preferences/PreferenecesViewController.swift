//
//  PreferenecesViewController.swift
//  Night-Shift
//
//  Created by Ankith on 2/27/20.
//  Copyright © 2020 Ankith. All rights reserved.
//

import Cocoa
import LaunchAtLogin

class PreferencesViewController: NSViewController {
    @IBOutlet weak var sourceCodeLabel: NSTextField!
    @IBOutlet weak var loginAtLaunchButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         loginAtLaunchButton.state = LaunchAtLogin.isEnabled ? .on : .off
    }
    
    override func viewWillAppear() {
        States.isPreferencesWindowOpen = true
    }
    
    override func viewWillDisappear() {
        States.isPreferencesWindowOpen = false
    }
    
    @IBAction func loginAtLaunchToggled(_ sender: NSButton) {
        LaunchAtLogin.isEnabled = LaunchAtLogin.isEnabled ? false : true
    }
}
