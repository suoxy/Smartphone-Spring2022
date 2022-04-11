//
//  KeychainService.swift
//  LoginApp
//
//  Created by Xiyue Suo on 3/27/22.
//

import Foundation
import KeychainSwift

class KeychianService {
    
    var _keyChain = KeychainSwift()
    var keyChain : KeychainSwift {
        get {
            return _keyChain
        }
        
        set {
            _keyChain = newValue
        }
    }
}
