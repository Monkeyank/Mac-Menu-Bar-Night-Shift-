//
//  StateManager.swift
//  Night-Shift
//
//  Created by Ankith on 2/29/20.
//  Copyright © 2020 Ankith. All rights reserved.
//

import Foundation

enum NightShiftEvent {
    case userDisabledNightShift
    case userEnabledNightShift
    case disableTimerStarted
    case disableTimerEnded
}

enum DisableTimer: Equatable {
    case off
    case hour(timer: Timer, endDate: Date)
    case custom(timer: Timer, endDate: Date)
    
    static func == (lhs: DisableTimer, rhs: DisableTimer) -> Bool {
        switch (lhs, rhs) {
        case (.off, .off):
            return true
        case (let .hour(leftTimer, leftDate), let .hour(rightTimer, rightDate)),
             (let .custom(leftTimer, leftDate), let .custom(rightTimer, rightDate)):
            return leftTimer == rightTimer && leftDate == rightDate
        default:
            return false
        }
    }
}

enum StateManager {
    private static var userInitiatedShift = false
    private static var enabled = true
    private static var fadeInAnimationActive = false
    private static var customTimeWindowOpen = false
    private static var preferencesWindowOpen = false
    
    static var disableTimer = DisableTimer.off {
        willSet {
            switch disableTimer {
            case .hour(let timer, _), .custom(let timer, _):
                timer.invalidate()
            default: break
            }
        }
    }
    
    static var isFadeInAnimationActive: Bool {
        get { return fadeInAnimationActive }
        set { fadeInAnimationActive = newValue}
    }
    
    static var isCustomTimeWindowOpen: Bool {
        get { return customTimeWindowOpen }
        set { customTimeWindowOpen = newValue}
    }
    
    static var isPreferencesWindowOpen: Bool {
        get { return preferencesWindowOpen }
        set { preferencesWindowOpen = newValue}
    }
    
    static var disabledTimer: Bool {
        return disableTimer != .off
    }
    
    static var isNightShiftEnabled: Bool {
        get { return enabled }
        set {
            enabled = newValue
            if newValue {
                NightShift.enable()
                Dimness.enable()
            } else {
                NightShift.disable()
                Dimness.disable()
            }
        }
    }
    
    static func respond(to event: NightShiftEvent) {
        switch event {
        case .userEnabledNightShift:
            disableTimer = .off
            isNightShiftEnabled = true
        case .userDisabledNightShift:
            isNightShiftEnabled = false
        case .disableTimerStarted:
            if isNightShiftEnabled {
                isNightShiftEnabled = false
            }
        case .disableTimerEnded:
            isNightShiftEnabled = true
        }
    }
}
