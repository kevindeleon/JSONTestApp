//
//  MainListController.swift
//  JSONTestApp
//
//  Created by Kevin deLeon on 6/3/15.
//  Copyright (c) 2015 Kevin deLeon. All rights reserved.
//

import UIKit

class MainListController: UITableViewController {
	
	var repositories = [Repository]()
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return repositories.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
		
		cell.textLabel?.text = repositories[indexPath.row].name
		cell.detailTextLabel?.text = repositories[indexPath.row].description
		
		return cell
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		var detailView = segue.destinationViewController as! DetailViewController
		
		if let indexPath = tableView.indexPathForSelectedRow() {
			let selectedRepo = repositories[indexPath.row]
			detailView.currentRepo = selectedRepo
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let reposURL = NSURL(string: "https://api.github.com/search/repositories?q=learn+swift+language:swift&sort=stars&order=desc")
		
		if let JSONData = NSData(contentsOfURL: reposURL!) {
			if let json = NSJSONSerialization.JSONObjectWithData(JSONData, options: nil, error: nil) as? NSDictionary {
				if let reposArray = json["items"] as? [NSDictionary] {
					for item in reposArray {
						repositories.append(Repository(json: item))
					}
				}
			}
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

