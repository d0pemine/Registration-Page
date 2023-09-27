//
//  RegisterViewController.swift
//  Sesi3
//
//  Created by prk on 27/09/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var nameList = ["Mamar", "Dipa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var NIMTextField: UITextField!
    
    @IBOutlet weak var NameTextField: UITextField!
    
    @IBOutlet weak var AddressTextField: UITextField!
    
    @IBOutlet weak var NumTextField: UITextField!
    
    func showError(message : String!){
        let errorAlert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: .default )
        present(errorAlert, animated: true)
    }
    
    @IBAction func RegisterOnClick(_ sender: Any) {
        let nim = NIMTextField.text!
        let name = NameTextField.text!
        let address = AddressTextField.text!
        let phoneNumber = NumTextField.text!
        
        var numericFlag = false
        for i in nim{
            if(i.isNumber == false){
                numericFlag = true
                break
            }
        }
        
        if(numericFlag){
            showError(message: "NIM must be numeric")
            return
        }
        
        if(name.count < 4){
            showError(message: "Name must be more than 4 characters")
        }
        
        if(address.hasSuffix("Street") == false){
            showError(message: "Address must ended with Street")
            return
        }
        
        if(address.hasPrefix("+62") == false){
            showError(message: "Phone Number must be started with +62")
            return
        }
        
        let registerAlert = UIAlertController(title: "Confirmation", message: "Please press OK to register", preferredStyle: .actionSheet)

        let okButton = UIAlertAction(title: "OK", style: .default, handler: {_ in self.nameList.append(name)
            print(self.nameList)
            
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        
        registerAlert.addAction(cancelButton)
        registerAlert.addAction(okButton)
        present(registerAlert, animated: true)
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
