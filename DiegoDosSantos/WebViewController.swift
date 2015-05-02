//
//  WebViewController.swift
//  DiegoDosSantos
//
//  Created by Diego dos Santos on 4/25/15.
//  Copyright (c) 2015 Diego dos Santos. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, NSURLConnectionDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    var urlString : String!
    var titleWeb : String!
    var connection : NSURLConnection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = titleWeb
        var request = NSURLRequest(URL: NSURL(string: urlString)!)
        connection = NSURLConnection(request: request, delegate: self, startImmediately: true)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        var label = UILabel()
        label.text = error.localizedDescription + " :("
        label.textColor = UIColor.grayColor()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        label.backgroundColor = UIColor.clearColor()
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.frame = CGRect(x: 8, y: 68, width: self.view.frame.width-8, height: 50)
        self.view.addSubview(label)
    }
   
    @IBAction func donePress(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
