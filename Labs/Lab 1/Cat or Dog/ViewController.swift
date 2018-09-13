//
//  ViewController.swift
//  Cat or Dog
//
//  Created by Caleb Gideon Wright on 9/13/18.
//  Copyright © 2018 Caleb Gideon Wright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dogButton(_ sender: UIButton) {
        myLabel.text = "Look, a dog!"
        myImage.image = #imageLiteral(resourceName: "dog")
    }
    
    @IBAction func catButton(_ sender: UIButton) {
        myLabel.text = "Look, a cat!"
        myImage.image = #imageLiteral(resourceName: "cat")
    }
    

}

