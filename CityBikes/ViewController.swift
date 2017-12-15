//
//  ViewController.swift
//  CityBikes
//
//  Created by Richard Smith on 2017-12-15.
//  Copyright © 2017 Richard Smith. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet var viewModel: ViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getStationsLund {
            self.tableView.reloadData()
        }
        viewModel.getStationsMalmo {
            self.tableView.reloadData()
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsToDisplay(in: section)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        print(viewModel.numberOfLocationsToDisplay())
        return viewModel.numberOfLocationsToDisplay()
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stationcell", for: indexPath)
        
        cell.textLabel?.text = viewModel.stationNameToDisplay(for: indexPath)
        
        cell.detailTextLabel?.text = viewModel.numberOfFreeBikesToDisplay(for: indexPath)
        return cell
    }
}

