//
//  Scene2ViewController.swift
//  lab4
//
//  Created by Caleb Gideon Wright on 10/11/18.
//  Copyright © 2018 Caleb Gideon Wright. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var birthDay: UILabel!
    
    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        userName.text=user.userName
        birthday.text=user.birthDay
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneFavs"{
            let scene1ViewController = segue.destination as! ViewController
            //check to see that text was entered in the textfields
            if userName.text!.isEmpty == false{
                scene1ViewController.user.userName=userName.text
            }
            if birthDay.text!.isEmpty == false{
                scene1ViewController.user.birthDay=birthDay.text
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
