//
//  Shopcontrol.swift
//  DeepDungeonsArturV2
//
//  Created by Artur Viader Mataix on 6/12/18.
//  Copyright © 2018 Artur Viader Mataix. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Shopcontrol:UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    @IBOutlet weak var lresul: UILabel!
    @IBOutlet weak var ptienda: UIPickerView!
    @IBOutlet weak var lmoney: UILabel!
    var seleccion:Int = 0
    var player: AVAudioPlayer?
    
    @IBAction func bback(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bbuy(_ sender: Any) {
        if(Variables.itemstienda.count>0)
        {
            if(Variables.heroes[Variables.login].dinero>=Variables.itemstienda[seleccion].precio)
            {
                Variables.heroes[Variables.login].stuff.insertaitem(item: Variables.itemstienda[seleccion])
                Variables.heroes[Variables.login].dinero -= Variables.itemstienda[seleccion].precio
                Variables.itemstienda.remove(at: seleccion)
                
                if(seleccion>=Variables.itemstienda.count)
                {
                    if(Variables.itemstienda.count>0)
                    {
                        seleccion -= 1
                    }
                }
              
                ptienda.reloadAllComponents()
                lresul.text = "Item comprado."
                muestradinero()
                reproducesonido()
            }
            else
            {
                lresul.text = "No tienes suficiente dinero para comprar este item."
            }
        }
    }
    
    func reproducesonido() {
        if let asset = NSDataAsset(name:"cash"){
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        seleccion = row
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Variables.itemstienda.count
        
    }
    
    func muestradinero()
    {
        lmoney.text = String(Variables.heroes[Variables.login].dinero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        muestradinero()
        ptienda.delegate = self
        ptienda.dataSource = self
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }

    
    //Arreglar no se ve suerte
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let fuente:UIFont = UIFont(name: "ArialMT", size: 18)!
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: pickerView.bounds.width, height: 100))
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myImageView.image = UIImage(named: Variables.itemstienda[row].nombre)
        let myLabel = UILabel(frame: CGRect(x: pickerView.bounds.width/3, y: 0, width: pickerView.bounds.width/3-10, height: 25))
        myLabel.font = fuente
        myLabel.text = "Ataque: " + String(Variables.itemstienda[row].ataque)
        myLabel.textColor = UIColor.white
        
        let myLabelb = UILabel(frame: CGRect(x: pickerView.bounds.width/3, y: 25, width: pickerView.bounds.width/3-10, height: 25))
        myLabelb.font = fuente
        myLabelb.text = "Defensa: " + String(Variables.itemstienda[row].defensa)
        myLabelb.textColor = UIColor.white
        
        let myLabelc = UILabel(frame: CGRect(x: pickerView.bounds.width/3, y: 50, width: pickerView.bounds.width/3-10, height: 25))
        myLabelc.font = fuente
        myLabelc.text = "Magia: " + String(Variables.itemstienda[row].magia)
        myLabelc.textColor = UIColor.white
        
        let myLabeld = UILabel(frame: CGRect(x: pickerView.bounds.width/3, y: 75, width: pickerView.bounds.width/3-10, height: 25))
        myLabeld.font = fuente
        myLabeld.text = "Suerte: " + String(Variables.itemstienda[row].suerte)
        myLabeld.textColor = UIColor.white
        
        let myLabele = UILabel(frame: CGRect(x: (pickerView.bounds.width/3)*2, y: 40, width: pickerView.bounds.width/3-10, height: 25))
        myLabele.font = fuente
        myLabele.text = "Dinero: " + String(Variables.itemstienda[row].precio)
        myLabele.textColor = UIColor.white
        
        myView.addSubview(myLabel)
        myView.addSubview(myLabelb)
        myView.addSubview(myLabelc)
        myView.addSubview(myLabeld)
        myView.addSubview(myLabele)

        
        myView.addSubview(myImageView)
        return myView
    }
}
