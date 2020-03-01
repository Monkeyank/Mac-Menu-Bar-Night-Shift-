//
//  NightShift.swift
//  Night-Shift
//
//  Created by Ankith on 2/29/20.
//  Copyright © 2020 Ankith. All rights reserved.
//
import Foundation

enum NightShift {
    
    private static let client = CBBlueLightClient()
    
    private static var blueLightStatus: Status {
        var status: Status = Status()
        client.getBlueLightStatus(&status)
        return status
    }
    
    static var blueLightReductionAmount: Float {
        get {
            var strength: Float = 0
            client.getStrength(&strength)
            return strength
        }
        set {
            client.setStrength(newValue, commit: true)
        }
    }
    
    static func previewBlueLightReductionAmount(_ value: Float) {
        client.setStrength(value, commit: false)
    }
    
    static var isNightShiftEnabled: Bool {
        get { return blueLightStatus.enabled.boolValue }
        set { client.setEnabled(newValue) }
    }
    
    public static func enable() {
        isNightShiftEnabled = true
    }
    
    public static func disable() {
        isNightShiftEnabled = false
    }
    
}
