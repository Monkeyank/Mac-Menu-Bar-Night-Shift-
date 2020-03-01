//
//  GeneralViewController.swift
//  Night-Shift
//
//  Created by Ankith on 2/29/20.
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
        StateManager.isPreferencesWindowOpen = true
    }
    
    override func viewWillDisappear() {
        StateManager.isPreferencesWindowOpen = false
    }
    
    @IBAction func loginAtLaunchToggled(_ sender: NSButton) {
        LaunchAtLogin.isEnabled = LaunchAtLogin.isEnabled ? false : true
    }
}
