//
//  ViewController.swift
//  SwiftJSS
//
//  Created by Tratta, Jason A on 2/13/15.
//
//  The MIT License (MIT)
//
// Copyright (c) 2015 Jason Tratta
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.
//

import Cocoa
import Alamofire

class ViewController: NSViewController, NSXMLParserDelegate {
    
    
    @IBOutlet weak var jssAddressTextField: NSTextField!
    @IBOutlet weak var usernameTextField: NSTextField!
    @IBOutlet weak var passwordSecureText: NSSecureTextField!
    @IBOutlet weak var testButton: NSButton!
    
    @IBOutlet weak var numberOfCPUsLabel: NSTextField!
    
    //Properties
    
     var computerArray: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
    
    
    
    @IBAction func testJSS(sender: AnyObject) {
        
        
        
        let address = jssAddressTextField.stringValue
        let username = usernameTextField.stringValue
        let password = passwordSecureText.stringValue
        let thePath = "computers"
        
        
        let credential = NSURLCredential(user: username, password: password, persistence: .ForSession)
        

        let constructedAddress = address + "/JSSResource/" + thePath
        Alamofire.request(.GET, constructedAddress, parameters: ["application/xml": "Accept"])
            .authenticate(usingCredential: credential)
            .responseData { response in
                debugPrint(response)
                
                let xmlParser = NSXMLParser(data: response.data!)
                xmlParser.delegate = self
                xmlParser.parse()

    }
    }
    
   
    
    
    func updateComputerCount() {
        
        let count = computerArray.count
        
        numberOfCPUsLabel.stringValue = String(count)
        
    }

    
    // MARK: Parser Methods
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        
        
        if (elementName == "computer") {
            
            computerArray.append(elementName)
            
        }
        
    }
    
    

    
    func parserDidEndDocument(parser: NSXMLParser) {
        
        
        updateComputerCount()
        
    }
    

    
    
    
}


