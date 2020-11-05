//
//  HeroeViewController.swift
//  HeroesNiveles
//
//  Created by KMMX on 05/11/20.
//
import UIKit

class HeroeViewController: UIViewController {
    
    var delegate: HerreroDelegate?
    var sword: Sword?
    
    @IBOutlet weak var labelNivel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.onReady(heroeDelegate: self)
        muestraNivel();
    }
    @IBAction func mejoraEspada(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
        let HerreroViewControllerInstance = storyboard.instantiateViewController(withIdentifier: "HerreroViewController")
                
                
                
        if let herreroViewController = HerreroViewControllerInstance as? HerreroViewController{
            self.navigationController?.reloadInputViews()
            
            herreroViewController.onUpgrade(sword: sword!, heroeDelegate: self)
        }
    }
    
    func muestraNivel(){
        if let espadaActual = self.sword {
            labelNivel.text = "Nivel: \(espadaActual.nivel)"
        }
    }
}

extension HeroeViewController: HeroeDelegate{
    func setSword(sword: Sword) {
        self.sword = sword
        muestraNivel()
    }
}


