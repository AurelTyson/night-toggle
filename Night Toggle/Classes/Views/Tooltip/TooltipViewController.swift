//
//  TooltipViewController.swift
//  Night Toggle
//
//  Created by Aurélien Tison on 02/10/2018.
//  Copyright © 2018 Aurel Tyson. All rights reserved.
//

import Cocoa
import RxCocoa
import RxSwift

public final class TooltipViewController: NSViewController {
    
    // MARK: Constants
    
    // MARK: Graphic attributes
    
    @IBOutlet private weak var btnToggle: NSButton!
    
    // MARK: Attributes
    
    private let disposeBag = DisposeBag()
    
    // MARK: Init
    
    public init() {
        super.init(nibName: "TooltipViewController", bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: View lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnToggle.rx.tap.subscribe(onNext: { _ in
            
            DarkMode.toggle()
            
        }).disposed(by: self.disposeBag)
    }
    
}
