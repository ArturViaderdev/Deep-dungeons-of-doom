//
//  Gamecontrol.swift
//  DeepDungeonsArturV2
//
//  Created by Artur Viader Mataix on 6/12/18.
//  Copyright © 2018 Artur Viader Mataix. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
class Gamecontrol:UIViewController{
    @IBOutlet weak var lresultado: UILabel!
    @IBOutlet weak var lgolpej: UILabel!
    @IBOutlet weak var lgolpem: UILabel!
    @IBOutlet weak var ijhd: UIImageView!
    @IBOutlet weak var ijhc: UIImageView!
    @IBOutlet weak var ijhb: UIImageView!
    @IBOutlet weak var ijha: UIImageView!
    @IBOutlet weak var ijugador: UIImageView!
    @IBOutlet weak var idadojc: UIImageView!
    @IBOutlet weak var idadojb: UIImageView!
    @IBOutlet weak var idadoja: UIImageView!
    @IBOutlet weak var idadomc: UIImageView!
    @IBOutlet weak var idadomb: UIImageView!
    @IBOutlet weak var idadoma: UIImageView!
    @IBOutlet weak var imonstruo: UIImageView!
    @IBOutlet weak var iha: UIImageView!
    @IBOutlet weak var ihd: UIImageView!
    @IBOutlet weak var ihb: UIImageView!
    @IBOutlet weak var ihc: UIImageView!
    var player: AVAudioPlayer?
    var dadosmonstruo:[Dado] = []
    var monstruomuerto = false
    var dadosjugador:[Dado] = []
    @IBAction func bback(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bfight(_ sender: UIButton) {
        
        if(Variables.heroes[Variables.login].vida > 0 && !monstruomuerto)
        {
            print(Variables.monstruos[Variables.selmonstruo].vida)
            
            tiradados()
            muestradados()
            reproducesonido()
        }
        else{
            lresultado.text = "Sin vida no se puede jugar."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refrescavidamonstruo()
        cargafotomonstruo()
        pondadosmonstruo()
        
        refrescavidajugador()
        cargafotojugador()
        pondadosjugador()
        
 
        
    }
    
    func muestradados()
    {
      
       switch(dadosjugador.count)
        {
        case 1:
            idadojb.image = dadosjugador[0].obtenimagen(tipo: false)
            
        case 2:
            idadoja.image = dadosjugador[0].obtenimagen(tipo: false)
            idadojb.image = dadosjugador[1].obtenimagen(tipo: false)
        case 3:
            idadoja.image = dadosjugador[0].obtenimagen(tipo: false)
            idadojb.image = dadosjugador[1].obtenimagen(tipo: false)
            idadojc.image = dadosjugador[2].obtenimagen(tipo: false)
        default:
            print("No se da")
        }
        
        switch(dadosmonstruo.count)
        {
        case 1:
            idadomb.image = dadosmonstruo[0].obtenimagen(tipo: true)
            
        case 2:
            idadoma.image = dadosmonstruo[0].obtenimagen(tipo: true)
            idadomb.image = dadosmonstruo[1].obtenimagen(tipo: true)
        case 3:
            idadoma.image = dadosmonstruo[0].obtenimagen(tipo: true)
            idadomb.image = dadosmonstruo[1].obtenimagen(tipo: true)
            idadomc.image = dadosmonstruo[2].obtenimagen(tipo: true)
        default:
            print("No se da")
        }
    }
    
    func tiradados()
    {
        var golpejugador:Int
        var golpemonstruo:Int
        var suma = 0
        for dado in dadosjugador
        {
            dado.tira()
            suma += dado.numero
           // print(dado.numero)
        }
        lgolpej.text = "Tu golpe: \(suma)"
        golpejugador = suma
        suma = 0
        for dado in dadosmonstruo
        {
            dado.tira()
            suma += dado.numero
            //print(dado.numero)
        }
        
        lgolpem.text = "Su golpe: \(suma)"
        golpemonstruo = suma
        
        if(golpemonstruo>golpejugador)
        {
            lresultado.text = "El monstruo te ha herido."
            Variables.heroes[Variables.login].vida -= 1
            refrescavidajugador()
            if(Variables.heroes[Variables.login].vida == 0)
            {
                lresultado.text = "El monstruo te ha derrotado."
                //El monstruo se lleva la experiencia del jugador
                Variables.monstruos[Variables.selmonstruo].exp += Variables.heroes[Variables.login].experiencia
            }
            else
            {
                lresultado.text = "El monstruo te ha herido."
                //Se suma 1 a la experiencia del monstruo
                Variables.monstruos[Variables.selmonstruo].exp += 1
            }
        }
        else if(golpemonstruo<golpejugador)
        {
            
            Variables.monstruos[Variables.selmonstruo].vida -= 1
            refrescavidamonstruo()
            if Variables.monstruos[Variables.selmonstruo].vida == 0
            {
                lresultado.text = "Has derrotado al monstruo."
                
                //El jugador se lleva la experiencia que tenía el monstruo
                Variables.heroes[Variables.login].experiencia += Variables.monstruos[Variables.selmonstruo].exp
                
                //Ganar dinero por haber matado a monstruo
                Variables.heroes[Variables.login].dinero += Variables.monstruos[Variables.selmonstruo].dinero
                
                    // create the alert
                    let alert = UIAlertController(title: "Has ganado", message: "Has derrotado al monstruo y has ganado \(Variables.monstruos[Variables.selmonstruo].dinero) euros.", preferredStyle: UIAlertController.Style.alert)
                
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                
                //Borramos el monstruo muerto
                Variables.monstruos.remove(at: Variables.selmonstruo)
                monstruomuerto = true
           
                Variables.cambiosmonstruos = true
     
            }
            else
            {
                lresultado.text = "Has herido al monstruo."
            }
        }
        else
        {
            lresultado.text = "Empate"
        }
    }
    
    func reproducesonido() {
        if let asset = NSDataAsset(name:"espada"){
            do {
                // Use NSDataAsset's data property to access the audio file stored in Sound.
                player = try AVAudioPlayer(data:asset.data, fileTypeHint:"mp3")
                // Play the above sound file.
                player?.play()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    func creadadosjugador(numdadosjugador:Int)
    {
        dadosjugador = creadados(numdados: numdadosjugador)
    }
    
    func creadadosmonstruo(numdadosmonstruo:Int)
    {
        dadosmonstruo = creadados(numdados: numdadosmonstruo)
    }
    
    func creadados(numdados:Int) -> [Dado]
    {
        var dados:[Dado] = []
        var cont:Int = 0
        while(cont<numdados)
        {
            dados.append(Dado())
            cont += 1
        }
        return dados
    }
    
    func pondadosmonstruo()
    {
        
        let numdadosmonstruo = Variables.monstruos[Variables.selmonstruo].getnumdados()
        switch(numdadosmonstruo)
        {
        case 1:
            idadoma.isHidden = true
            idadomb.isHidden = false
            idadomc.isHidden = true
        case 2:
            idadoma.isHidden = false
            idadomb.isHidden = false
            idadomc.isHidden = true
        case 3:
            idadoma.isHidden = false
            idadomb.isHidden = false
            idadomc.isHidden = false
        default:
            idadoma.isHidden = false
            idadomb.isHidden = false
            idadomc.isHidden = false
        }
        creadadosmonstruo(numdadosmonstruo: numdadosmonstruo)
        
    }
    
    func pondadosjugador()
    {
        let numdadosjugador = Variables.heroes[Variables.login].getnumdados()
        switch(numdadosjugador)
        {
        case 1:
            idadoja.isHidden = true
            idadojb.isHidden = false
            idadojc.isHidden = true
        case 2:
            idadoja.isHidden = false
            idadojb.isHidden = false
            idadojc.isHidden = true
        case 3:
            idadoja.isHidden = false
            idadojb.isHidden = false
            idadojc.isHidden = false
        default:
            idadoja.isHidden = false
            idadojb.isHidden = false
            idadojc.isHidden = false
        }
   
        creadadosjugador(numdadosjugador: numdadosjugador)
    }
    
    func cargafotomonstruo()
    {
        imonstruo.image = UIImage(named: Variables.monstruos[Variables.selmonstruo].imagen)
    }
    
    func cargafotojugador()
    {
        ijugador.image = UIImage(named: Variables.heroes[Variables.login].imagen)
    }
    
    func refrescavidajugador()
    {
        switch (Variables.heroes[Variables.login].vida)
        {
        case 0:
            ijha.isHidden = true
            ijhb.isHidden = true
            ijhc.isHidden = true
            ijhd.isHidden = true
        case 1:
            ijha.isHidden = false
            ijhb.isHidden = true
            ijhc.isHidden = true
            ijhd.isHidden = true
        case 2:
            ijha.isHidden = false
            ijhb.isHidden = false
            ijhc.isHidden = true
            ijhd.isHidden = true
        case 3:
            ijha.isHidden = false
            ijhb.isHidden = false
            ijhc.isHidden = false
            ijhd.isHidden = true
        case 4:
            ijha.isHidden = false
            ijhb.isHidden = false
            ijhc.isHidden = false
            ijhd.isHidden = false
        default:
            ijha.isHidden = false
            ijhb.isHidden = false
            ijhc.isHidden = false
            ijhd.isHidden = false
        }
    }
    
    func refrescavidamonstruo()
    {
        switch (Variables.monstruos[Variables.selmonstruo].vida)
        {
        case 0:
            iha.isHidden = true
            ihb.isHidden = true
            ihc.isHidden = true
            ihd.isHidden = true
        case 1:
            iha.isHidden = false
            ihb.isHidden = true
            ihc.isHidden = true
            ihd.isHidden = true
        case 2:
            iha.isHidden = false
            ihb.isHidden = false
            ihc.isHidden = true
            ihd.isHidden = true
        case 3:
            iha.isHidden = false
            ihb.isHidden = false
            ihc.isHidden = false
            ihd.isHidden = true
        case 4:
            iha.isHidden = false
            ihb.isHidden = false
            ihc.isHidden = false
            ihd.isHidden = false
        default:
            iha.isHidden = false
            ihb.isHidden = false
            ihc.isHidden = false
            ihd.isHidden = false
        }
    }
}
