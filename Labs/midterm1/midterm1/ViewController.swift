//
//  ViewController.swift
//  midterm1
//
//  Created by Caleb Gideon Wright on 10/18/18.
//  Copyright © 2018 Caleb Gideon Wright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var weekSwitch: UISwitch!
    @IBOutlet weak var minSlider: UISlider!
    @IBOutlet weak var mileLabel: UILabel!
    @IBOutlet weak var calLabel: UILabel!
    @IBOutlet weak var distanceFloat: UILabel!
    @IBOutlet weak var minOutlet: UITextField!
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    @IBOutlet weak var image: UIImageView!
    
    
    var sliderVal: Float = 0
    var weekly = true;
    var hours: Float = 0
    var calories = 0.0
    var minutes: Float = 0
    
    
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        updateImg()
    }
    
    @IBAction func minAction(_ sender: UITextField) {
        minutes = Float(sender.text!)!
        print(minutes)
        updateHours()
        updateLabels(min: minutes)
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateWeekly()
        updateLabels(min: minutes)
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        distanceFloat.isHidden = false
        let labelText=sender.value
        sliderVal = sender.value
        //updateLabels(labelText: sender.value)
        distanceFloat.text=String(format: "%.0f", labelText)
    }
    func updateHours(){
        hours=minutes/60
        print("Hours: \(hours)")
        updateLabels(min: hours)
    }
    
    
    
    
    func updateImg(){
        if segmentOutlet.selectedSegmentIndex == 0 {
            image.image=UIImage(named: "run")
        }
        else if segmentOutlet.selectedSegmentIndex == 1 {
            image.image=UIImage(named: "swim")
        }
        else if segmentOutlet.selectedSegmentIndex == 2{
            image.image=UIImage(named: "bike")
        }
    }
    func updateLabels(min: Float){
        var calLabelText=hours*600
        //calLabelText = calLabelText*(minutes/10)
        if weekly==true{
            calLabelText = calLabelText*5
        }
        calLabel.text=String(format: "%.0f", calLabelText)
    }
    func updateWeekly(){
        if weekSwitch.isOn{
            weekly = true
            print("weekly is on")
        }
        else{
            weekly = false
            print("weekly is off")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateImg()
        updateWeekly()
        distanceFloat.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTapGestureRecognized(_ sender: UITapGestureRecognizer) {
        minOutlet.resignFirstResponder()
    }


}
extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


