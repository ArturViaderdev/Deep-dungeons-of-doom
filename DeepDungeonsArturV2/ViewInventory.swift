//
//  ViewInventory.swift
//  DeepDungeonsArturV2
//
//  Created by Artur Viader Mataix on 04/12/2018.
//  Copyright © 2018 Artur Viader Mataix. All rights reserved.
//

import Foundation
import UIKit
class ViewInventory:UIViewController{
    @IBOutlet weak var iperso: UIImageView!
    @IBOutlet weak var lexp: UILabel!
    @IBOutlet weak var lmon: UILabel!
    @IBOutlet weak var llck: UILabel!
    @IBOutlet weak var lmag: UILabel!
    @IBOutlet weak var ldef: UILabel!
    @IBOutlet weak var latq: UILabel!
    @IBOutlet weak var ihd: UIImageView!
    @IBOutlet weak var ihc: UIImageView!
    @IBOutlet weak var ihb: UIImageView!
    @IBOutlet weak var iha: UIImageView!
    @IBOutlet weak var imagico: UIImageView!
    @IBOutlet weak var iescudo: UIImageView!
    @IBOutlet weak var iarmadura: UIImageView!
    @IBOutlet weak var icalzado: UIImageView!
    @IBOutlet weak var iespada: UIImageView!
    @IBOutlet weak var icasco: UIImageView!
    @IBAction func bback(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        icasco.image = UIImage(named: Variables.heroes[Variables.login].stuff.recuperaritem(tipo: "casco").nombre)
        iespada.image = UIImage(named: Variables.heroes[Variables.login].stuff.recuperaritem(tipo: "espada").nombre)
        icalzado.image = UIImage(named: Variables.heroes[Variables.login].stuff.recuperaritem(tipo: "calzado").nombre)
        iarmadura.image = UIImage(named: Variables.heroes[Variables.login].stuff.recuperaritem(tipo: "armadura").nombre)
        iescudo.image = UIImage(named: Variables.heroes[Variables.login].stuff.recuperaritem(tipo: "escudo").nombre)
        imagico.image = UIImage(named: Variables.heroes[Variables.login].stuff.recuperaritem(tipo: "magico").nombre)
        latq.text = String(Variables.heroes[Variables.login].stuff.getataque())
        ldef.text = String(Variables.heroes[Variables.login].stuff.getdefensa())
        lmag.text = String(Variables.heroes[Variables.login].stuff.getmagia())
        llck.text = String(Variables.heroes[Variables.login].stuff.getsuerte())
        lmon.text = String(Variables.heroes[Variables.login].dinero)
        lexp.text = String(Variables.heroes[Variables.login].experiencia)
        iperso.image = UIImage(named: Variables.heroes[Variables.login].imagen)
        
        switch(Variables.heroes[Variables.login].vida)
        {
        case 0:
            iha.isHidden=true
            ihb.isHidden=true
            ihc.isHidden=true
            ihd.isHidden=true
        case 1:
            iha.isHidden=true
            ihb.isHidden=false
            ihc.isHidden=false
            ihd.isHidden=false
        case 2:
            iha.isHidden=true
            ihb.isHidden=true
            ihc.isHidden=false
            ihd.isHidden=false
        case 3:
            iha.isHidden=true
            ihb.isHidden=true
            ihc.isHidden=true
            ihd.isHidden=false
        case 4:
            iha.isHidden=true
            ihb.isHidden=true
            ihc.isHidden=true
            ihd.isHidden=true
        default:
            iha.isHidden=true
            ihb.isHidden=true
            ihc.isHidden=true
            ihd.isHidden=true
        }
    }
}
