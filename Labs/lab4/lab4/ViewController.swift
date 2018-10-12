//
//  ViewController.swift
//  lab4
//
//  Created by Caleb Gideon Wright on 10/7/18.
//  Copyright © 2018 Caleb Gideon Wright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameOut: UITextField!
    
    @IBOutlet weak var birthdayOut: UITextField!
    @IBAction func userName(_ sender: UITextField) {
    }
    @IBAction func birthday(_ sender: UITextField) {
    }
    
    class Birthday:Codable{
        var userName : String?
        var birthDay: String?
    }
    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        userNameOut.text=user.userName
        birthdayOut.text=user.birthDay
    }
    
    var user = Birthday()
    let filename = "birthday.plist"
    func dataFileURL(_ filename:String) -> URL?{
        let urls = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)
        var url : URL?
        url = urls.first?.appendingPathComponent(filename)
        return url
    }
    private func configureTextFields(){
        userNameOut.delegate = self
        birthdayOut.delegate = self
        
    }
    @objc func applicationWillResignActive(_ notification: Notification){
        let fileURL = dataFileURL(filename)
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do{
            let plistData = try encoder.encode(user)
            try plistData.write(to: fileURL!)
        }
        catch{
            print("Write error")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        let fileURL = dataFileURL(filename)
        if FileManager.default.fileExists(atPath: (fileURL?.path)!){
            let url = fileURL!
            do{
                let data = try Data(contentsOf: url)
                let decoder = PropertyListDecoder()
                user = try decoder.decode(Birthday.self, from: data)
                userNameOut.text = user.userName
                birthdayOut.text = user.birthDay
            }
            catch{
                print("no file")
            }
        }
        else{
            print("File does not exist")
        }
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive(_:)), name: Notification.Name.UIApplicationWillResignActive, object: app)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func onTapGestureRecognized(_ sender: UITapGestureRecognizer) {
        userNameOut.resignFirstResponder()
        birthdayOut.resignFirstResponder()
    }
}
extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
