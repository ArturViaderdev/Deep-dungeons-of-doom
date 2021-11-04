//
//  Dado.swift
//  DeepDungeonsArturV2
//
//  Created by Artur Viader Mataix on 6/12/18.
//  Copyright © 2018 Artur Viader Mataix. All rights reserved.
//

import Foundation
import UIKit
class Dado{
    var numero:Int = 0
    
    func obtenimagen(tipo:Bool) -> UIImage
    {
        var nombre:String
        if(tipo)
        {
            nombre = "dice\(numero)"
        }
        else
        {
            nombre = "dice\(numero)U"
        }
        return UIImage(named: nombre)!
    }
    
    init()
    {
        
    }
    
    func tira()
    {
        numero = Int.random(in: 1 ... 12)
    }
}
