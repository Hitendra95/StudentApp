//
//  FirstViewController.swift
//  StudentTestFinalApp
//
//  Created by Hitendra Dubey on 28/06/18.
//  Copyright © 2018 Hitendra Dubey. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var notificationButton: UIBarButtonItem!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addNewTestButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        //self.addNewTestButton.applyGradient(colours: [UIColor.init(red: 0, green: 224, blue: 181, alpha: 1.0),UIColor.init(red: 00, green: 00, blue: 00, alpha:1.0)], locations: [0.0, 0.5, 1.0])

        //tableView.layer.borderColor = self.addNewTestButton.backgroundColor?.cgColor
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentChanged(_ sender: segmentView) {
    }
    
    @IBAction func addNewTestButtonPressed(_ sender: Any) {
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewTable = UIView()
        viewTable.backgroundColor = UIColor.clear
        return viewTable
        
    }
    @IBAction func searchButtonPressed(_ sender: Any) {
    }
    @IBOutlet weak var notificationButtonPressed: UIBarButtonItem!
}

extension UIView {
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
}
