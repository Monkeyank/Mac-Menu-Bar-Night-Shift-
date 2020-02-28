//
//  LinkText.swift
//  Night-Shift
//
//  Created by Ankith on 2/27/20.
//  Copyright © 2020 Ankith. All rights reserved.
//

import Cocoa

@IBDesignable
class HyperlinkTextField: NSTextField {

    @IBInspectable var href: String = ""

    override func resetCursorRects() {
        discardCursorRects()
        addCursorRect(self.bounds, cursor: NSCursor.pointingHand)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: NSColor.linkColor,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue as AnyObject
        ]
        attributedStringValue = NSAttributedString(string: self.stringValue, attributes: attributes)
    }

    override func mouseDown(with theEvent: NSEvent) {
        if let localHref = URL(string: href) {
            NSWorkspace.shared.open(localHref)
        }
    }
}

