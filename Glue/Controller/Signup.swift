//
//  SignupController.swift
//  Glue
//
//  Created by Macbook Pro on 30/01/18.
//  Copyright © 2018 Dzaky ZF. All rights reserved.
//

import UIKit
import Eureka
import ImageRow
import GenericPasswordRow
import Alamofire
import INTULocationManager

class Signup: FormViewController {
    var userlat = String()
    var userlng = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        form +++ Section("Data utama")
            <<< ImageRow() {
                $0.tag="image"
                $0.title = "Gambar profil"
                $0.sourceTypes = [.PhotoLibrary, .SavedPhotosAlbum, .Camera]
                $0.clearAction = .yes(style: UIAlertActionStyle.destructive)
            }
            <<< IntRow(){
                $0.title = "NRP"
                $0.add(rule: RuleRequired())
                $0.placeholder = "Masukan nrp anda"
                $0.tag="nrp"
                $0.validationOptions = .validatesOnChange
            }.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
            <<< NameRow(){
                $0.tag="nama"
                $0.title = "Nama"
                $0.add(rule: RuleRequired())
                $0.placeholder = "Masukan nama anda"
                $0.validationOptions = .validatesOnChange
            }.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
            <<< EmailRow(){
                $0.tag="email"
                $0.title = "Email"
                $0.add(rule: RuleRequired())
                $0.add(rule: RuleEmail())
                $0.placeholder = "Masukan email anda"
                $0.validationOptions = .validatesOnChange
            }.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
            <<< GenericPasswordRow(){
                $0.tag="password"
                $0.add(rule: RuleRequired())
                $0.placeholder = "Masukan password anda"
                $0.validationOptions = .validatesOnChange
            }.cellUpdate { cell, row in
                if !row.isValid {
                    cell.titleLabel?.textColor = .red
                }
            }
            <<< PhoneRow(){
                $0.tag="nohp"
                $0.title = "Nomor HP"
                $0.placeholder = "Masukan nomor hp anda"
            }
        
        
        let locationManager = INTULocationManager.sharedInstance()
        locationManager.requestLocation(withDesiredAccuracy: .city,
                                        timeout: 10.0,
                                        delayUntilAuthorized: true) { (currentLocation, achievedAccuracy, status) in
                                            if (status == INTULocationStatus.success) {
                                                self.userlat = "\(currentLocation?.coordinate.latitude ?? 0)"
                                                self.userlng = "\(currentLocation?.coordinate.longitude ?? 0)"
                                    
                                            }
                                            else if (status == INTULocationStatus.timedOut) {
                                
                                            }
                                            else {
                        
                                            }
        }
    }
    
    @IBAction func signupclick(_ sender: Any) {
        if form.validate().isEmpty {
            let formvalues = form.values()
            let imageui = formvalues["image"]! ?? nil
            let parameters = [
                Keys.user_email: formvalues["email"] as! String,
                Keys.user_password: formvalues["password"] as! String,
                Keys.user_nrp: String(formvalues["nrp"] as! Int),
                Keys.user_nama: formvalues["nama"] as! String,
                Keys.user_no_hp: formvalues["nohp"] as! String,
                Keys.user_lat: userlat,
                Keys.user_lng: userlng
            ]
            var imageData : Data!
            if imageui != nil {
                imageData = UIImagePNGRepresentation(imageui as! UIImage)
            }
            
            Alamofire.upload( multipartFormData: { multipartFormData in
                if imageui != nil {
                    multipartFormData.append(imageData, withName: "image", fileName: "image.png" , mimeType: "image/png")
                }
                for (key, val) in parameters {
                    multipartFormData.append(val.data(using: .utf8)!, withName: key)
                }
            }, to: Keys.URL_SIGNUP, encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _): upload.responseString { response in
                    switch response.result.value! {
                    case "berhasil", "":
                        Alamofire.request(Keys.URL_LOGIN, method:.post, parameters:parameters).responseJSON { response in
                            switch response.result {
                            case .success:
                            
                                let JSON = response.result.value as? NSDictionary
                                
                                let defaults = UserDefaults.standard
                                for (key, value) in JSON! {
                                    let temp = key as? String
                                    defaults.set(value, forKey: temp!)
                                }
                                self.performSegue(withIdentifier: "homesegue2", sender: self)
                                
                            case .failure( _):
                                print("error")
                            }
                        }
                    case "error_nrp":
                        let alertController = UIAlertController(title: "Login", message:
                            "NRP belum terdaftar", preferredStyle: UIAlertControllerStyle.alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                    case "error_signed":
                        let alertController = UIAlertController(title: "Login", message:
                            "Anda sudah terdaftar", preferredStyle: UIAlertControllerStyle.alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                    default:
                        let alertController = UIAlertController(title: "Error", message:
                            "Input bermasalah", preferredStyle: UIAlertControllerStyle.alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                    }
                    }case .failure( _):
                        let alertController = UIAlertController(title: "Error", message:
                            "Server bermasalah", preferredStyle: UIAlertControllerStyle.alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                }
            })
           
        }
    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
