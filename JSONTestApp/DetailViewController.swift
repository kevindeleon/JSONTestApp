//
//  DetailViewController.swift
//  JSONTestApp
//
//  Created by Kevin deLeon on 6/5/15.
//  Copyright (c) 2015 Kevin deLeon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	@IBOutlet weak var webView: UIWebView!
	
	var currentRepo: Repository?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// these should probably be unrwapped more safely
		var repoURL = NSURL(string: currentRepo!.html_url!)
		var repoRequest = NSURLRequest(URL: repoURL!)

		webView.loadRequest(repoRequest)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
