//
//  ViewController.swift
//  SwiftTimer
//
//  Created by AK on 14/10/14.
//  Copyright (c) 2014 JetBrains. All rights reserved.
//

var myResults: Results = Results()

import UIKit

class ViewController: UIViewController {
    var myStart: Bool = false
    var myTimer: Timer?

    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var SaveButton: UIButton!
    @IBOutlet weak var Indicator:UIActivityIndicatorView!
    
    func timer_handler(str:String) {
        TimeLabel.text = str
    }

    @IBAction func start_button(sender: AnyObject) {
        if myStart {
            myStart = false
            StartButton.setTitle("Start", forState:UIControlState.Normal)
            Indicator.stopAnimating()
            myTimer?.stop()
        } else {
            myStart = true
            StartButton.setTitle("Stop", forState:UIControlState.Normal)
            Indicator.startAnimating()
            myTimer?.start()
        }
    }

    @IBAction func save_result_button(sender: AnyObject) {
        //Stop the timer if it's working first
        if myStart {
            myStart = false
            StartButton.setTitle("Start", forState:UIControlState.Normal)
            Indicator.stopAnimating()
            myTimer?.stop()
        }
        
        //Save result
        myResults.addResult(myTimer!.getLastTime())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTimer = Timer(handler: timer_handler)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(animated: Bool) {
        myTimer?.stop()
        super.viewWillDisappear(animated)
    }
}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: self.view.frame)
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Results"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myResults.size()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView?.dequeueReusableCellWithIdentifier("ResultCell") as! UITableViewCell
        //cell.textLabel.text = myResults.getResult(indexPath.row)
        return cell
    }
}
