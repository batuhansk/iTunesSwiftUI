//
//  Formatter+Extensions.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import Foundation

public extension DateComponentsFormatter {
    
    static let `default`: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        return formatter
    }()
    
}
