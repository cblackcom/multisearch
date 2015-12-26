//
//  ContentViewController.swift
//  MultiSearch
//
//  Copyright © 2015 Colin Black (http://cblack.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Cocoa

class ContentViewController: NSTabViewController {
    
    var frameImage:WebViewController!
    var frameDict:WebViewController!
    var frameHanzi:WebViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // http://spin.atomicobject.com/2015/07/21/ios-container-views/
        // http://stackoverflow.com/questions/24035984/instantiate-and-present-a-viewcontroller-in-swift
        
        frameImage = self.storyboard?.instantiateControllerWithIdentifier("webViewController") as! WebViewController
        let sviImage = NSTabViewItem(viewController: frameImage)
        self.addTabViewItem(sviImage)
        
        frameDict = self.storyboard?.instantiateControllerWithIdentifier("webViewController") as! WebViewController
        let sviDict = NSTabViewItem(viewController: frameDict)
        self.addTabViewItem(sviDict)
        
        frameHanzi = self.storyboard?.instantiateControllerWithIdentifier("webViewController") as! WebViewController
        let sviHanzi = NSTabViewItem(viewController: frameHanzi)
        self.addTabViewItem(sviHanzi)
    }
    
    func loadQuery(query:String) {
        // http://stackoverflow.com/questions/31254725/transport-security-has-blocked-a-cleartext-http
        // http://nshipster.com/nsurl/
        let escapedQuery = query.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        frameImage.loadURLString("http://images.google.com.tw/search?q=" + escapedQuery + "&sout=1&tbm=isch")
        frameDict.loadURLString("https://en.wiktionary.org/wiki/" + escapedQuery)
        frameHanzi.loadURLString("http://www.hanzicraft.com/character/" + escapedQuery)
    }
}
