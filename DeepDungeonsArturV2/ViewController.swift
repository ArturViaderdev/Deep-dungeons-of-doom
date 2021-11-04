//
//  ViewController.swift
//  DeepDungeonsArturV2
//
//  Created by Artur Viader Mataix on 27/11/2018.
//  Copyright © 2018 Artur Viader Mataix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func bresettienda(_ sender: UIButton) {
        resettienda()
    }
    @IBAction func bresetdungeon(_ sender: UIButton) {
        resetdungeon()
    }
 
    @IBAction func bresetgeneral(_ sender: UIButton) {
        reseta()
        resetb()
        resetc()
        resetd()
        resettienda()
        resetdungeon()
    }
    
    func resettienda()
    {
        Variables.itemstienda.removeAll()
        creaitemstienda()
    }
    
    func resetdungeon()
    {
        Variables.monstruos.removeAll()
        creamonstruos()
    }
    
    func reseta()
    {
        Variables.heroes[0].vida = 4
        Variables.heroes[0].dinero = 500
        Variables.heroes[0].experiencia = 5
        creaobjheroea()
        muestraheroea()
    }
    
    func resetb()
    {
        Variables.heroes[0].vida = 5
        Variables.heroes[0].dinero = 300
        Variables.heroes[0].experiencia = 2
        creaobjheroeb()
        muestraheroeb()
    }
    
    func resetc()
    {
        Variables.heroes[0].vida = 3
        Variables.heroes[0].dinero = 200
        Variables.heroes[0].experiencia = 3
        creaobjheroec()
        muestraheroec()
    }
    
    func resetd()
    {
        Variables.heroes[0].vida = 6
        Variables.heroes[0].dinero = 250
        Variables.heroes[0].experiencia = 7
        creaobjheroed()
        muestraheroed()
    }
    
    @IBAction func bresetc(_ sender: UIButton) {
        resetc()
    }
    @IBAction func bresetb(_ sender: UIButton) {
        resetb()
    }
    @IBAction func breseta(_ sender: UIButton) {
        reseta()
    }
    @IBAction func bresetd(_ sender: UIButton) {
        resetd()
    }
    
    @IBOutlet weak var lmaga: UILabel!
    @IBOutlet weak var ihdd: UIImageView!
    @IBOutlet weak var ihdc: UIImageView!
    @IBOutlet weak var ihdb: UIImageView!
    @IBOutlet weak var ihda: UIImageView!
    @IBOutlet weak var ihcd: UIImageView!
    @IBOutlet weak var ihcc: UIImageView!
    @IBOutlet weak var ihcb: UIImageView!
    @IBOutlet weak var ihca: UIImageView!
    @IBOutlet weak var ihbd: UIImageView!
    @IBOutlet weak var ihbc: UIImageView!
    @IBOutlet weak var ihbb: UIImageView!
    @IBOutlet weak var ihba: UIImageView!
    @IBOutlet weak var ihad: UIImageView!
    @IBOutlet weak var ihac: UIImageView!
    @IBOutlet weak var ihab: UIImageView!
    @IBOutlet weak var ihaa: UIImageView!
    @IBOutlet weak var latqa: UILabel!
    
    @IBOutlet weak var ldefa: UILabel!
 
    @IBOutlet weak var llcka: UILabel!
    @IBOutlet weak var ldefc: UILabel!
    @IBOutlet weak var lmagc: UILabel!
    @IBOutlet weak var llckc: UILabel!
    @IBOutlet weak var latqd: UILabel!
    @IBOutlet weak var lmagd: UILabel!
    @IBOutlet weak var llckd: UILabel!
    
    @IBOutlet weak var ldefd: UILabel!
    
    @IBOutlet weak var latqc: UILabel!
    @IBOutlet weak var latqb: UILabel!
    
    @IBOutlet weak var llckb: UILabel!
    @IBOutlet weak var lmagb: UILabel!
    
    @IBOutlet weak var ldefb: UILabel!
    @IBOutlet weak var iheroea: UIImageView!
    @IBOutlet weak var iheroeb: UIImageView!
    @IBOutlet weak var iheroec: UIImageView!
    @IBOutlet weak var iheroed: UIImageView!
    
    @IBAction func bheroea(_ sender: Any) {
        loginheroe(numero: 0)
    }
    @IBAction func bheroeb(_ sender: Any) {
        loginheroe(numero: 1)
    }
    @IBAction func bheroec(_ sender: Any) {
        loginheroe(numero: 2)
    }
    @IBAction func bheroed(_ sender: Any) {
        loginheroe(numero: 3)
    }
    @IBOutlet weak var theroea: UILabel!
    @IBOutlet weak var theroec: UILabel!
    @IBOutlet weak var theroeb: UILabel!
    @IBOutlet weak var theroed: UILabel!
    
    
    func loginheroe(numero:Int)
    {
        //Se muestra la pantalla de administración
        Variables.login = numero
        performSegue(withIdentifier: "peligeopcion", sender: self)
        
    }
    
    func creaitemstienda()
    {
        Variables.itemstienda.append(Item(nombre: "armour", ataque: 2, defensa: 6, suerte: 5, tipo: "armadura", precio: 100, magia: 5))
        Variables.itemstienda.append(Item(nombre: "shield", ataque: 20, defensa: 7, suerte: 5, tipo: "escudo", precio: 200, magia: 6))
        
        Variables.itemstienda.append(Item(nombre: "armour2", ataque: 5, defensa: 3, suerte: 5, tipo: "armadura", precio: 500, magia: 7))
        Variables.itemstienda.append(Item(nombre: "armour3", ataque: 6, defensa: 9, suerte: 5, tipo: "armadura", precio: 300, magia: 8))
        
        Variables.itemstienda.append(Item(nombre: "arrow", ataque: 3, defensa: 4, suerte: 5, tipo: "espada", precio: 1000, magia: 9))
        Variables.itemstienda.append(Item(nombre: "arrow2", ataque: 8, defensa: 2, suerte: 5, tipo: "espada", precio: 100, magia: 6))
        
        Variables.itemstienda.append(Item(nombre: "arrow3", ataque: 9, defensa: 1, suerte: 5, tipo: "espada", precio: 400, magia: 5))
        Variables.itemstienda.append(Item(nombre: "boots", ataque: 10, defensa: 7, suerte: 5, tipo: "calzado", precio: 300, magia: 4))
        
        Variables.itemstienda.append(Item(nombre: "boots2", ataque: 13, defensa: 9, suerte: 5, tipo: "calzado", precio: 100, magia: 10))
        Variables.itemstienda.append(Item(nombre: "cap", ataque: 14, defensa: 6, suerte: 5, tipo: "casco", precio: 50, magia: 7))
        
        Variables.itemstienda.append(Item(nombre: "cap2", ataque: 20, defensa: 6, suerte: 5, tipo: "casco", precio: 120, magia: 20))
        Variables.itemstienda.append(Item(nombre: "cap3", ataque: 7, defensa: 4, suerte: 5, tipo: "casco", precio: 140, magia: 18))
        
        Variables.itemstienda.append(Item(nombre: "helmet1", ataque: 15, defensa: 6, suerte: 5, tipo: "casco", precio: 210, magia: 6))
        Variables.itemstienda.append(Item(nombre: "helmet2", ataque: 12, defensa: 8, suerte: 5, tipo: "casco", precio: 250, magia: 3))
        
        Variables.itemstienda.append(Item(nombre: "helmet3", ataque: 30, defensa: 8, suerte: 5, tipo: "casco", precio: 160, magia: 1))
        Variables.itemstienda.append(Item(nombre: "helmet4", ataque: 24, defensa: 2, suerte: 5, tipo: "casco", precio: 300, magia: 2))
        
        Variables.itemstienda.append(Item(nombre: "helmet5", ataque: 10, defensa: 1, suerte: 5, tipo: "casco", precio: 100, magia: 49))
        Variables.itemstienda.append(Item(nombre: "necklace", ataque: 12, defensa: 6, suerte: 5, tipo: "magico", precio: 100, magia: 25))
        
        Variables.itemstienda.append(Item(nombre: "ring", ataque: 7, defensa: 3, suerte: 8, tipo: "magico", precio: 50, magia: 10))
        Variables.itemstienda.append(Item(nombre: "ring2", ataque: 4, defensa: 3, suerte: 3, tipo: "magico", precio: 80, magia: 15))
        
        Variables.itemstienda.append(Item(nombre: "scepter", ataque: 18, defensa: 3, suerte: 1, tipo: "magico", precio: 90, magia: 78))
        Variables.itemstienda.append(Item(nombre: "scepter2", ataque: 8, defensa: 3, suerte: 4, tipo: "magico", precio: 1000, magia: 3))
        
        Variables.itemstienda.append(Item(nombre: "scepter3", ataque: 20, defensa: 3, suerte: 7, tipo: "magico", precio: 50, magia: 1))
        
        Variables.itemstienda.append(Item(nombre: "shield2", ataque: 8, defensa: 3, suerte: 7, tipo: "escudo", precio: 200, magia: 4))
        
        Variables.itemstienda.append(Item(nombre: "shield3", ataque: 9, defensa: 3, suerte: 4, tipo: "escudo", precio: 250, magia: 3))
        Variables.itemstienda.append(Item(nombre: "shield4", ataque: 10, defensa: 3, suerte: 3, tipo: "escudo", precio: 400, magia: 7))
        
        Variables.itemstienda.append(Item(nombre: "sword1", ataque: 13, defensa: 3, suerte: 7, tipo: "espada", precio: 500, magia: 8))
        Variables.itemstienda.append(Item(nombre: "sword2", ataque: 6, defensa: 3, suerte: 8, tipo: "espada", precio: 300, magia: 7))
        
        Variables.itemstienda.append(Item(nombre: "sword3", ataque: 7, defensa: 3, suerte: 9, tipo: "espada", precio: 300, magia: 10))
        Variables.itemstienda.append(Item(nombre: "sword4", ataque: 8, defensa: 3, suerte: 10, tipo: "espada", precio: 200, magia: 6))
    }
    
    func creamonstruos()
    {
     
        Variables.monstruos.append(Monstruo(nombre: "Hombre piedra", ataque: 10, exp: 6, dinero: 100, imagen: "monster1", vida: 4))
        Variables.monstruos.append(Monstruo(nombre: "Árbol furioso", ataque: 40, exp: 8, dinero: 30, imagen: "monster2", vida:3))
        Variables.monstruos.append(Monstruo(nombre: "Rata", ataque: 5, exp: 2, dinero: 30, imagen: "monster3",vida:2))
        Variables.monstruos.append(Monstruo(nombre: "Cangrejo", ataque: 6, exp: 3, dinero: 80, imagen: "monster4",vida:1))
        Variables.monstruos.append(Monstruo(nombre: "Araña", ataque: 7, exp: 5, dinero: 70, imagen: "monster5",vida:4))
        Variables.monstruos.append(Monstruo(nombre: "Ladrón", ataque: 22, exp: 10, dinero: 115, imagen: "monster6",vida:4))
        Variables.monstruos.append(Monstruo(nombre: "Zariguella", ataque: 10, exp: 9, dinero: 10, imagen: "monster7",vida:4))
        
        Variables.monstruos.append(Monstruo(nombre: "Bicho verde", ataque: 10, exp: 6, dinero: 100, imagen: "monster8", vida: 4))
        Variables.monstruos.append(Monstruo(nombre: "Superpájaro", ataque: 40, exp: 8, dinero: 30, imagen: "monster9", vida:3))
        Variables.monstruos.append(Monstruo(nombre: "Cucaverde", ataque: 5, exp: 2, dinero: 30, imagen: "monster10",vida:2))
        Variables.monstruos.append(Monstruo(nombre: "Espadachín", ataque: 6, exp: 3, dinero: 80, imagen: "monster11",vida:1))
       
        
        Variables.monstruos.append(Monstruo(nombre: "Quadcopter", ataque: 7, exp: 5, dinero: 70, imagen: "monster11b",vida:4))
        
         Variables.monstruos.append(Monstruo(nombre: "Chepeto", ataque: 7, exp: 5, dinero: 70, imagen: "monster12",vida:4))
        
        Variables.monstruos.append(Monstruo(nombre: "Caperuzo", ataque: 22, exp: 10, dinero: 115, imagen: "monster13",vida:4))
        Variables.monstruos.append(Monstruo(nombre: "Grisaceo", ataque: 10, exp: 9, dinero: 10, imagen: "monster14",vida:4))
        Variables.monstruos.append(Monstruo(nombre: "Rey monger", ataque: 10, exp: 9, dinero: 10, imagen: "monster15",vida:4))
        
    }
    
    func creaobjheroea()
    {
        
        Variables.heroes[0].stuff.insertaitem(item: Item(nombre: "helmet1", ataque: 2, defensa: 3, suerte: 5, tipo: "casco", precio: 1000, magia: 5))
        
        Variables.heroes[0].stuff.insertaitem(item: Item(nombre: "sword1", ataque: 7, defensa: 3, suerte: 2, tipo: "espada", precio: 50, magia: 5))
        
        Variables.heroes[0].stuff.insertaitem(item: Item(nombre: "armour", ataque: 8, defensa: 8, suerte: 7, tipo: "armadura", precio: 200, magia: 5))
        
        Variables.heroes[0].stuff.insertaitem(item: Item(nombre: "shield", ataque: 5, defensa: 7, suerte: 66, tipo: "escudo", precio: 500, magia: 5))
        
        Variables.heroes[0].stuff.insertaitem(item: Item(nombre: "boots", ataque: 8, defensa: 5, suerte: 2, tipo: "calzado", precio: 100, magia: 5))
        
        Variables.heroes[0].stuff.insertaitem(item: Item(nombre: "magic", ataque: 7, defensa: 8, suerte: 7, tipo: "magico", precio: 200, magia: 5))
        
    
    }
    
    func creaobjheroeb()
    {
        
        Variables.heroes[1].stuff.insertaitem(item: Item(nombre: "helmet1", ataque: 2, defensa: 3, suerte: 5, tipo: "casco", precio: 100, magia: 3))
        
        Variables.heroes[1].stuff.insertaitem(item: Item(nombre: "shield", ataque: 5, defensa: 7, suerte: 66, tipo: "escudo", precio: 200, magia: 3))
        
        Variables.heroes[1].stuff.insertaitem(item: Item(nombre: "boots", ataque: 8, defensa: 5, suerte: 2, tipo: "calzado", precio: 100, magia: 5))
        
        Variables.heroes[1].stuff.insertaitem(item: Item(nombre: "magic", ataque: 7, defensa: 8, suerte: 7, tipo: "magico", precio: 200, magia: 5))
    }
    
    func creaobjheroec()
    {
        Variables.heroes[2].stuff.insertaitem(item: Item(nombre: "sword1", ataque: 7, defensa: 3, suerte: 2, tipo: "espada", precio: 20, magia: 6))
        
        Variables.heroes[2].stuff.insertaitem(item: Item(nombre: "armour", ataque: 8, defensa: 8, suerte: 7, tipo: "armadura", precio: 100, magia: 4))
        
        Variables.heroes[2].stuff.insertaitem(item: Item(nombre: "shield", ataque: 5, defensa: 7, suerte: 66, tipo: "escudo", precio: 300, magia: 4))
    }
    
    func creaobjheroed()
    {
        Variables.heroes[3].stuff.insertaitem(item: Item(nombre: "boots", ataque: 8, defensa: 5, suerte: 2, tipo: "calzado", precio: 200, magia:6))
        
        Variables.heroes[3].stuff.insertaitem(item: Item(nombre: "magic", ataque: 7, defensa: 8, suerte: 7, tipo: "magico", precio: 100, magia: 8))
    }
    
    func creaheroes()
    {
        Variables.heroes.append(Heroe(nombre: "Ansgar", vida: 4, dinero: 500, experiencia: 5, imagen: "heroe1"))
        Variables.heroes.append(Heroe(nombre: "Faelwen", vida: 5, dinero: 300, experiencia: 2, imagen: "heroe2"))
        Variables.heroes.append(Heroe(nombre: "Lothar", vida: 3, dinero: 200, experiencia: 3, imagen: "heroe3"))
        Variables.heroes.append(Heroe(nombre: "Retrasivo", vida: 6, dinero: 250, experiencia: 7, imagen: "heroe4"))
        
        
        creaobjheroea()
        creaobjheroeb()
        creaobjheroec()
        creaobjheroed()
    }
    
    func muestraheroea()
    {
        theroea.text = Variables.heroes[0].nombre
        iheroea.image = UIImage(named: Variables.heroes[0].imagen)
        latqa.text = String(Variables.heroes[0].stuff.getataque())
        ldefa.text = String(Variables.heroes[0].stuff.getdefensa())
        lmaga.text = String(Variables.heroes[0].stuff.getmagia())
        llcka.text = String(Variables.heroes[0].stuff.getsuerte())
        
        switch(Variables.heroes[0].vida)
        {
        case 0:
            ihaa.isHidden = true
            ihab.isHidden = true
            ihac.isHidden = true
            ihad.isHidden = true
        case 1:
            ihaa.isHidden = false
            ihab.isHidden = true
            ihac.isHidden = true
            ihad.isHidden = true
        case 2:
            ihaa.isHidden = false
            ihab.isHidden = false
            ihac.isHidden = true
            ihad.isHidden = true
        case 3:
            ihaa.isHidden = false
            ihab.isHidden = false
            ihac.isHidden = false
            ihad.isHidden = true
        case 4:
            ihaa.isHidden = false
            ihab.isHidden = false
            ihac.isHidden = false
            ihad.isHidden = false
        default:
            ihaa.isHidden = false
            ihab.isHidden = false
            ihac.isHidden = false
            ihad.isHidden = false
        }
    }
    
    func muestraheroeb()
    {
        theroeb.text = Variables.heroes[1].nombre
        iheroeb.image = UIImage(named: Variables.heroes[1].imagen)
        latqb.text = String(Variables.heroes[1].stuff.getataque())
        ldefb.text = String(Variables.heroes[1].stuff.getdefensa())
        lmagb.text = String(Variables.heroes[1].stuff.getmagia())
        llckb.text = String(Variables.heroes[1].stuff.getsuerte())
        switch(Variables.heroes[1].vida)
        {
        case 0:
            ihba.isHidden = true
            ihbb.isHidden = true
            ihbc.isHidden = true
            ihbd.isHidden = true
        case 1:
            ihba.isHidden = false
            ihbb.isHidden = true
            ihbc.isHidden = true
            ihbd.isHidden = true
        case 2:
            ihba.isHidden = false
            ihbb.isHidden = false
            ihbc.isHidden = true
            ihbd.isHidden = true
        case 3:
            ihba.isHidden = false
            ihbb.isHidden = false
            ihbc.isHidden = false
            ihbd.isHidden = true
        case 4:
            ihba.isHidden = false
            ihbb.isHidden = false
            ihbc.isHidden = false
            ihbd.isHidden = false
        default:
            ihba.isHidden = false
            ihbb.isHidden = false
            ihbc.isHidden = false
            ihbd.isHidden = false
        }
    }
    
    func muestraheroec()
    {
        theroec.text = Variables.heroes[2].nombre
        iheroec.image = UIImage(named: Variables.heroes[2].imagen)
        latqc.text = String(Variables.heroes[2].stuff.getataque())
        ldefc.text = String(Variables.heroes[2].stuff.getdefensa())
        lmagc.text = String(Variables.heroes[2].stuff.getmagia())
        llckc.text = String(Variables.heroes[2].stuff.getsuerte())
        switch(Variables.heroes[2].vida)
        {
        case 0:
            ihca.isHidden = true
            ihcb.isHidden = true
            ihcc.isHidden = true
            ihcd.isHidden = true
        case 1:
            ihca.isHidden = false
            ihcb.isHidden = true
            ihcc.isHidden = true
            ihcd.isHidden = true
        case 2:
            ihca.isHidden = false
            ihcb.isHidden = false
            ihcc.isHidden = true
            ihcd.isHidden = true
        case 3:
            ihca.isHidden = false
            ihcb.isHidden = false
            ihcc.isHidden = false
            ihcd.isHidden = true
        case 4:
            ihca.isHidden = false
            ihcb.isHidden = false
            ihcc.isHidden = false
            ihcd.isHidden = false
        default:
            ihca.isHidden = false
            ihcb.isHidden = false
            ihcc.isHidden = false
            ihcd.isHidden = false
        }
    }
    
    func muestraheroed()
    {
        theroed.text = Variables.heroes[3].nombre
        iheroed.image = UIImage(named: Variables.heroes[3].imagen)
        latqd.text = String(Variables.heroes[3].stuff.getataque())
        ldefd.text = String(Variables.heroes[3].stuff.getdefensa())
        lmagd.text = String(Variables.heroes[3].stuff.getmagia())
        llckd.text = String(Variables.heroes[3].stuff.getsuerte())
        switch(Variables.heroes[3].vida)
        {
        case 0:
            ihda.isHidden = true
            ihdb.isHidden = true
            ihdc.isHidden = true
            ihdd.isHidden = true
        case 1:
            ihda.isHidden = false
            ihdb.isHidden = true
            ihdc.isHidden = true
            ihdd.isHidden = true
        case 2:
            ihda.isHidden = false
            ihdb.isHidden = false
            ihdc.isHidden = true
            ihdd.isHidden = true
        case 3:
            ihda.isHidden = false
            ihdb.isHidden = false
            ihdc.isHidden = false
            ihdd.isHidden = true
        case 4:
            ihda.isHidden = false
            ihdb.isHidden = false
            ihdc.isHidden = false
            ihdd.isHidden = false
        default:
            ihda.isHidden = false
            ihdb.isHidden = false
            ihdc.isHidden = false
            ihdd.isHidden = false
        }
    }
    
    func muestraheroes(){
        muestraheroea()
        muestraheroeb()
        muestraheroec()
        muestraheroed()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        muestraheroes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creaheroes()
        creaitemstienda()
        creamonstruos()
    }

    override func viewWillDisappear(_ animated: Bool) {
        guardadatos()
    }

    func guardadatos()
    {
        
    }
}

