//
//  Logger.swift
//  UnitTest
//
//  Created by Md Hosne Mobarok on 1/2/26.
//

import UIKit

enum Logger {
    static func log(_ message: String) {
        #if DEBUG
        print("LOG:", message)
        #endif
    }
}
