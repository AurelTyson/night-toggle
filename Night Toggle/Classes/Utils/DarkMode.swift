//
//  DarkMode.swift
//  Night Toggle
//
//  Created by Aurélien Tison on 02/10/2018.
//  Copyright © 2018 Aurel Tyson. All rights reserved.
//

import Cocoa

public final class DarkMode {
    
    private static let TOGGLE_DARK_MODE_COMMAND = "tell application \"System Events\" to tell appearance preferences to set dark mode to not dark mode"
    
    public static var isEnabled: Bool {
        return UserDefaults.standard.string(forKey: "AppleInterfaceStyle") == "Dark"
    }
    
    public static func toggle() {
        _ = NSAppleScript(source: TOGGLE_DARK_MODE_COMMAND)?.executeAndReturnError(nil).stringValue
    }
    
}
