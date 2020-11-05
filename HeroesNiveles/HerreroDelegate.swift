//
//  SwordInput.swift
//  HeroesNiveles
//
//  Created by KMMX on 04/11/20.
//

protocol HerreroDelegate{
    func onReady(heroeDelegate: HeroeDelegate)
    func onUpgrade(sword: Sword, heroeDelegate: HeroeDelegate)
}
