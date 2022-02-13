//
//  ProtocolSendMessage.swift
//  ProtocolAndDelegate
//
//  Created by Xiyue Suo on 2/13/22.
//

import Foundation

protocol SendFirstAndLastNameDelegate { // global func
    
    func setFirstAndLastName(firstName: String, lastName : String)
    func setWelcomeText(welcomeText : String)
    
}


protocol SendMessageDelegate {
    
    func sendMessage (message : String)
    
}

