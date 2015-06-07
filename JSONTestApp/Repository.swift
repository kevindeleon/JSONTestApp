//
//  Repository.swift
//  JSONTestApp
//
//  Created by Kevin deLeon on 6/3/15.
//  Copyright (c) 2015 Kevin deLeon. All rights reserved.
//

import UIKit

struct Repository {
	var name: String?
	var description: String?
	var html_url: String?
	
	init(json: NSDictionary) {
		name = json["name"] as? String
		description = json["description"] as? String
		html_url = json["html_url"] as? String
	}
}
