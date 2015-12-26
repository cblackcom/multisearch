//
//  ViewController.swift
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

class MainViewController: NSViewController {
    
    var contentVC:ContentViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // http://stackoverflow.com/questions/13279105/access-container-view-controller-from-parent-ios
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "splitEmbedSegue" {
            contentVC = segue.destinationController as? ContentViewController
        }
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBOutlet weak var queryField: NSTextField!
    @IBOutlet weak var contentView: NSView!
    
    @IBAction func querySubmit(sender: AnyObject) {
        //print("it is " + queryField.stringValue)
        contentVC?.loadQuery(queryField.stringValue)
    }
}

