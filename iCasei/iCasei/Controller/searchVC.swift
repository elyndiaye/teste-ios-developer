//
//  ViewController.swift
//  iCasei
//
//  Created by ely.assumpcao.ndiaye on 07/05/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

class searchVC: UIViewController {
    
    @IBOutlet weak var searchTxt: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
}
    
    @IBAction func searchBtnPressed(_ sender: Any) {
        
        guard let FieldSearch = searchTxt.text , searchTxt.text != "" else {
            EmptyTextField(text: "Preencha o campo Search", message: "O campo de pesquisa deve ser preenchido")
            return }
        
        searchServices.instance.findAllSearchs(search: FieldSearch) { (success,errorMessage) in
            if success{
                print ("foi")
               // print (UserService.instance.userName)
                self.performSegue(withIdentifier:TO_VIDEO , sender: nil)
            }
            else{
                let message = errorMessage
                print(message)
                self.EmptyTextField(text: "Pay Atention", message: message)
            }
        }//findAllUsers
    }
    
    func EmptyTextField(text: String, message: String?){
        let alert = UIAlertController(title: text, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true) }

}

