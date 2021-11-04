//
//  Dungeoncontrol.swift
//  DeepDungeonsArturV2
//
//  Created by Artur Viader Mataix on 6/12/18.
//  Copyright © 2018 Artur Viader Mataix. All rights reserved.
//

import Foundation
import UIKit

class Dungeoncontrol:UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    @IBOutlet weak var pdungeon: UIPickerView!
    var seleccionado:Int = 0
    
    func hola()
    {
        print("hola")
    }
    
    @IBAction func bfight(_ sender: UIButton) {
        if(Variables.monstruos.count>0)
        {
            Variables.selmonstruo = seleccionado
            performSegue(withIdentifier: "vbatalla", sender: self)
        }  
    }
    @IBAction func bback(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Variables.monstruos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        seleccionado = row
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let fuente:UIFont = UIFont(name: "ArialMT", size: 18)!
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: pickerView.bounds.width, height: 100))
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myImageView.image = UIImage(named: Variables.monstruos[row].imagen)
        let myLabel = UILabel(frame: CGRect(x: pickerView.bounds.width/2, y: 0, width: pickerView.bounds.width/2-10, height: 25))
        myLabel.font = fuente
        myLabel.text = "Nombre: " + String(Variables.monstruos[row].nombre)
        myLabel.textColor = UIColor.white
        
        let myLabelb = UILabel(frame: CGRect(x: pickerView.bounds.width/2, y: 25, width: pickerView.bounds.width/2-10, height: 25))
        myLabelb.font = fuente
        myLabelb.text = "Ataque: " + String(Variables.monstruos[row].ataque)
        myLabelb.textColor = UIColor.white
        
        let myLabelc = UILabel(frame: CGRect(x: pickerView.bounds.width/2, y: 50, width: pickerView.bounds.width/2-10, height: 25))
        myLabelc.font = fuente
        myLabelc.text = "Exp: " + String(Variables.monstruos[row].exp)
        myLabelc.textColor = UIColor.white
        
        let myLabeld = UILabel(frame: CGRect(x: pickerView.bounds.width/2, y: 75, width: pickerView.bounds.width/2-10, height: 25))
        myLabeld.font = fuente
        myLabeld.text = "Dinero: " + String(Variables.monstruos[row].dinero)
        myLabeld.textColor = UIColor.white
        
        myView.addSubview(myLabel)
        myView.addSubview(myLabelb)
        myView.addSubview(myLabelc)
        myView.addSubview(myLabeld)
     
        myView.addSubview(myImageView)
        return myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Variables.cambiosmonstruos=false
        pdungeon.delegate = self
        pdungeon.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(Variables.cambiosmonstruos)
        {
            Variables.cambiosmonstruos = false
            if(seleccionado>=Variables.monstruos.count)
            {
                if(Variables.monstruos.count>0)
                {
                    seleccionado -= 1
                }
            }
            pdungeon.reloadAllComponents()
        }
    } 
}
