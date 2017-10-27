//
//  RegisterViewController.swift
//  iPlay
//
//  Created by mac_admin on 27/10/17.
//  Copyright © 2017 mac_admin. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var fnameField: UITextField!
    @IBOutlet var interestsView: UIPickerView!
    @IBOutlet var bday: UIDatePicker!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var lnameField: UILabel!
    
   
    @IBAction func registerAction(_ sender: Any) {
        
    }
    
    //MARK:- View Methods
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

extension RegisterViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
    }
    
    
    
    
}
