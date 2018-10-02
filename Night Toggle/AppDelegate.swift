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
    
    private let popover = NSPopover()
    private let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    private var eventMonitor: EventMonitor?
    
    // MARK: AppDelegate

    public func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
            button.action = #selector(togglePopover(_:))
        }
        
        self.popover.contentViewController = TooltipViewController()
        
        self.eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [weak self] event in
            if let strongSelf = self, strongSelf.popover.isShown {
                strongSelf.closePopover(sender: event)
            }
        }

    }
    
    public func applicationWillTerminate(_ aNotification: Notification) {
        
    }
    
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
        eventMonitor?.start()
    }
    
    func closePopover(sender: Any?) {
        popover.performClose(sender)
        eventMonitor?.stop()
    }
    
}
