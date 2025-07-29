//
//  Observable.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 11/11/24.
//

import Foundation

class Observable<T> {
    
    // MARK: - Properties
    
    var value: T {
        didSet {
            self.valueChanged?(self.value)
        }
    }
    
    private var valueChanged: ((T) -> Void)?
    
    // MARK: - Life cycle
    
    init(value: T) {
        self.value = value
    }
    
    // MARK: - Methods
    
    func addObserver(fireNow: Bool = false, _ onChange: ((T) -> Void)?) {
        valueChanged = onChange
        if fireNow {
            onChange?(value)
        }
    }
    
    func fireNow() {
        valueChanged?(self.value)
    }
    
    func removeObserver() {
        valueChanged = nil
    }
}
