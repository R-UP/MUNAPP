//
//  MasterViewController.swift
//  Instamun
//
//  Created by Rohit Upadhyaya on 23/01/17.
//  Copyright © 2017 Rohit Upadhyaya. All rights reserved.
//

import UIKit

extension MasterViewController :
UISearchResultsUpdating {
    func
        updateSearchResultsForSearchController(searchController : UISearchController) {
        filterContentForSearchText(scope: searchController.searchBar.text!)
    }
    }


class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    //var objects = [Any]()
    //let searchController = UISearchController(searchResultsController : nil)
    /*var filteredparameters = [Country]()
    override func viewDidLoad() {
        super.viewDidLoad()
        Country = [
            Country(category:"P5",name:"China"),
            Country(category:"P5",name:"France"),
            Country(category:"P5",name:"Russia"),
            Country(category:"P5",name:"United Kingdom"),
            Country(category:"P5",name:"United States"),
            Country(category:"BRICS",name:"India"),
            Country(category:"BRICS",name:"Brazil"),
            Country(category:"BRICS",name:"South Africa")
            ]
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem

        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject()))
        self.navigationItem.rightBarButtonItem = addButton()
        let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
            
        }
        
        
    }
/*
    func filterContentForSearchText(search-Text : String, scope: String = "All"){
        filteredparameters = Country.filter {
            country in
            return
            Country.name.lowercaseString.containsString(searchText.lowercaseString)
        }
        tableView.reloadData()
    }*/
    
    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return objects.count
//    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if searchController.active && searchController.searchBar.text != "" {
                return filteredparameters.count
            }
            return Country.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = objects[indexPath.row] as! NSDate
        cell.textLabel!.text = object.description
        return cell
    }
    override func tableView(tableView: UITabView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let country: Country
        if searchController.active && searchController.searchBar.text != "" {
            country = filteredparameters[indexPath.row]
        }else {
            country = Country[indexPath.row]
        }
    cell.textlabel?.text=country.name
    cell.detailTextLabel?.text = country.category
        return cell
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }*/


}


 



