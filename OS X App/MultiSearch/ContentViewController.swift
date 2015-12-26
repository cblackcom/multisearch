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

class ContentViewController: NSSplitViewController {
    
    var viewMenu:NSMenu?
    
    var frameImage:WebViewController!
    
    var tabVC:NSTabViewController!
    
    var frameDict:WebViewController!
    var frameHanzi:WebViewController!
    var frameForvo:WebViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // http://spin.atomicobject.com/2015/07/21/ios-container-views/
        // http://stackoverflow.com/questions/24035984/instantiate-and-present-a-viewcontroller-in-swift
        
        frameImage = self.storyboard?.instantiateControllerWithIdentifier("webViewController") as! WebViewController
        self.addSplitViewItem(NSSplitViewItem(viewController: frameImage))
        
        tabVC = self.storyboard?.instantiateControllerWithIdentifier("tabViewController") as! NSTabViewController
        self.addSplitViewItem(NSSplitViewItem(viewController: tabVC))
        
        viewMenu = NSApplication.sharedApplication().mainMenu?.itemWithTitle("View")?.submenu
        viewMenu?.autoenablesItems = false
        
        frameDict = self.storyboard?.instantiateControllerWithIdentifier("webViewController") as! WebViewController
        let iDict = NSTabViewItem(viewController: frameDict)
        iDict.label = "Wiktionary"
        tabVC.addTabViewItem(iDict)
        tabVC.selectedTabViewItemIndex = 0  // hack to get the view loaded
        let miDict = NSMenuItem(title: "Wiktionary", action: Selector("switchToTab:"), keyEquivalent: "1")
        miDict.target = self
        viewMenu?.addItem(miDict)
        
        frameHanzi = self.storyboard?.instantiateControllerWithIdentifier("webViewController") as! WebViewController
        let iHanzi = NSTabViewItem(viewController: frameHanzi)
        iHanzi.label = "HanziCraft"
        tabVC.addTabViewItem(iHanzi)
        tabVC.selectedTabViewItemIndex = 1  // hack to get the view loaded
        let miHanzi = NSMenuItem(title: "HanziCraft", action: Selector("switchToTab:"), keyEquivalent: "2")
        miHanzi.target = self
        viewMenu?.addItem(miHanzi)
        
        frameForvo = self.storyboard?.instantiateControllerWithIdentifier("webViewController") as! WebViewController
        let iForvo = NSTabViewItem(viewController: frameForvo)
        iForvo.label = "Forvo"
        tabVC.addTabViewItem(iForvo)
        tabVC.selectedTabViewItemIndex = 2  // hack to get the view loaded
        let miForvo = NSMenuItem(title: "Forvo", action: Selector("switchToTab:"), keyEquivalent: "3")
        miForvo.target = self
        viewMenu?.addItem(miForvo)
        
        viewMenu?.addItem(NSMenuItem.separatorItem())
        
        tabVC.selectedTabViewItemIndex = 0
    }
    
    func loadQuery(query:String) {
        // http://stackoverflow.com/questions/31254725/transport-security-has-blocked-a-cleartext-http
        // http://nshipster.com/nsurl/
        let escapedQuery = query.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        frameImage.loadURLString("http://images.google.com.tw/search?q=" + escapedQuery + "&sout=1&tbm=isch")
        frameDict.loadURLString("https://en.wiktionary.org/wiki/" + escapedQuery)
        frameHanzi.loadURLString("http://www.hanzicraft.com/character/" + escapedQuery)
        frameForvo.loadURLString("http://forvo.com/word/" + escapedQuery + "/#zh")
    }
    
    func switchToTab(mi:NSMenuItem?) {
        if let mi = mi, viewMenu = viewMenu {
            tabVC.selectedTabViewItemIndex = viewMenu.indexOfItem(mi)
        }
    }
    
}
