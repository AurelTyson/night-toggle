//
//  EventMonitor.swift
//  Night Toggle
//
//  Created by Aurélien Tison on 02/10/2018.
//  Copyright © 2018 Aurel Tyson. All rights reserved.
//

import Cocoa

public final class EventMonitor {
    
    // MARK: Attributes
    
    private var monitor: Any?
    private let mask: NSEvent.EventTypeMask
    private let handler: (NSEvent?) -> ()
    
    // MARK: Init
    
    public init(mask: NSEvent.EventTypeMask, handler: @escaping (NSEvent?) -> ()) {
        self.mask = mask
        self.handler = handler
    }
    
    deinit {
        self.stop()
    }
    
    // MARK: Methods
    
    public func start() {
        self.monitor = NSEvent.addGlobalMonitorForEvents(matching: self.mask, handler: self.handler)
    }
    
    public func stop() {
        guard let lMonitor = self.monitor else {
            return
        }
        NSEvent.removeMonitor(lMonitor)
        self.monitor = nil
    }
    
}
