//
//  JSSCommClientDelegate.swift
//  SwiftJSS
//
//  Created by Tratta, Jason A on 2/13/15.
//  Copyright (c) 2015 Indiana University. All rights reserved.
//

import Foundation


protocol JSSCommClientDelegate {
    
    
    
    func dataReturned(data: NSMutableData)
    func updateStatus(statusMsg: String)
    func connectionFailed(errMsg: String)
    func authFailed(errMsg: String)
    func urlError(errMsg: String)
    func otherError(errMsg: String)
    func connectionSucceeded(message: String)
    
}