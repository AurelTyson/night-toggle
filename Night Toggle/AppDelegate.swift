//
//  AppDelegate.swift
//  Night Toggle
//
//  Created by Aurélien Tison on 02/10/2018.
//  Copyright © 2018 Aurel Tyson. All rights reserved.
//

import Cocoa

@NSApplicationMain
public final class AppDelegate: NSObject, NSApplicationDelegate {
    
    // MARK: Graphic attributes
    
    @IBOutlet public weak var window: NSWindow!
    
    // MARK: Attributes
    
    private let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    private let contextMenu: NSMenu! = constructMenu()
    
    // MARK: AppDelegate

    public func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Menu icon
        if let button = self.statusItem.button {
            button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
            button.action = #selector(self.statusBarButtonClicked(sender:))
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
        }
        
    }
    
    // MARK: Actions
    
    @objc func statusBarButtonClicked(sender: NSStatusBarButton) {
        
        // Current event
        let lCurrentEvent = NSApp.currentEvent!
        
        // If right click
        if lCurrentEvent.type == .rightMouseUp {
            
            // Show menu
            self.statusItem.menu = self.contextMenu
            self.statusItem.popUpMenu(contextMenu)
            
            // This is critical, otherwise clicks won't be processed again
            self.statusItem.menu = nil
            
        }
        else {
            
            // Toggle Dark mode
            DarkMode.toggle()
            
        }
        
    }
    
    // MARK: Utils
    
    private class func constructMenu() -> NSMenu {
        
        // Init the menu entries
        let lMenu = NSMenu()
        lMenu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        return lMenu
        
    }
    
}
