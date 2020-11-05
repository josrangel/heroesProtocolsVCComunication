//
//  ViewController.swift
//  HeroesNiveles
//
//  Created by KMMX on 04/11/20.
//

import UIKit

class HerreroViewController: UIViewController {
    var espada: Sword?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        espada = Sword()
        
    }


    @IBAction func muestraHeroe(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let heroeViewController = storyboard.instantiateViewController(withIdentifier: "HeroeViewController")
                
                
                
                if let heroeViewControllerInstanciate = heroeViewController as? HeroeViewController{
                    self.navigationController?.pushViewController(heroeViewController, animated: true)
                    heroeViewController.tabBarItem.title = "Heroe"
                    heroeViewControllerInstanciate.delegate = self
                }
    }
}

extension HerreroViewController: HerreroDelegate{
    func onReady(heroeDelegate: HeroeDelegate) {
        if let espadaHeroe = self.espada {
            heroeDelegate.setSword(sword: espadaHeroe)
        }
    }
    
    func onUpgrade(sword: Sword, heroeDelegate: HeroeDelegate) {
        var swordNew = sword
        if swordNew.nivel < 2{
            swordNew.nivel += 1
        }else{
            swordNew.nivel *= 2
        }
        heroeDelegate.setSword(sword: swordNew)

    }
}
