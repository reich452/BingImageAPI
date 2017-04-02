//
//  ImageTableViewController.swift
//  BingImageSearch
//
//  Created by Nick Reichard on 4/2/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class ImageTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }



    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }

}
