//
//  ViewController.swift
//  lab2
//
//  Created by Caleb Gideon Wright on 9/19/18.
//  Copyright © 2018 Caleb Gideon Wright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBAction func mySwitch(_ sender: UISwitch) {
        if !sender.isOn {
            myImage.image = nil
            myLabel.text = "Turn the switch on"
        }
    }
    @IBAction func mySlider(_ sender: UISlider) {
        let currentVal = sender.value
        let episodeVal:Int = Int(currentVal)
        myLabel.text = "Episode \(episodeVal+1)"
        if episodeVal+1 == 1{
            myImage.image = #imageLiteral(resourceName: "one")
        }
        if episodeVal+1 == 2{
            myImage.image = #imageLiteral(resourceName: "two")
        }
        if episodeVal+1 == 3{
            myImage.image = #imageLiteral(resourceName: "three")
        }
        if episodeVal+1 == 4{
            myImage.image = #imageLiteral(resourceName: "four")
        }
        if episodeVal+1 == 5{
            myImage.image = #imageLiteral(resourceName: "five")
        }
        if episodeVal+1 == 6{
            myImage.image = #imageLiteral(resourceName: "six")
        }
        if episodeVal+1 == 7{
            myImage.image = #imageLiteral(resourceName: "seven")
        }
        if episodeVal+1 == 8{
            myImage.image = #imageLiteral(resourceName: "eight")
        }
    }
    @IBAction func mySegment(_ sender: UISegmentedControl) {
        if segmentOutlet.selectedSegmentIndex == 0{
            self.view.backgroundColor = UIColor(red: 196/255, green: 25/255, blue: 25/255, alpha: 1)
        }
        if segmentOutlet.selectedSegmentIndex == 1{
            self.view.backgroundColor = UIColor(red: 20/255, green: 173/255, blue: 30/255, alpha: 1)
        }
        if segmentOutlet.selectedSegmentIndex == 2{
            self.view.backgroundColor = UIColor(red: 24/255, green: 57/255, blue: 188/255, alpha: 1)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

