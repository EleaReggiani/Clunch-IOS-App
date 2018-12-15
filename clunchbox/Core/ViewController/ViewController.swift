//
//  ViewController.swift
//  clunchbox
//
//  Created by Macintosh on 13/11/2018.
//  Copyright © 2018 Eléa Reggiani. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginButton.layer.cornerRadius = (self.loginButton.frame.height)/2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    @IBAction func createAccountAction(_ sender: Any) {
        
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let password: String = "vavoudamour"
        let username: String = "Elea83"
        if (password != self.passwordTextField.text! && username != self.usernameTextField.text!){
            print("Le mot de passe ou l'identifiant est incorrecte")
        }
        else {
            print("connexion réussie")
            //après connexion = push sur nouvel écran (identifiant "tabBar" et classe "UITabBarController" à modifier)
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
           // self.navigationController?.pushViewController(viewController, animated: true) // Si le next n'est pas un TabBar ou navBar
            self.present(viewController, animated: true, completion: nil)
            
            /*
             //Code a inserer dans chacun des VC du TabBar :
             
             required init?(coder aDecoder: NSCoder) {
             super.init(coder: coder)
             
             tabBarItem = UITabBarItem(title: "Nom affiche en bas", image: "Icone en bas", tag: 0)
             }
             */
            
            
        }
        
    }
    
}

