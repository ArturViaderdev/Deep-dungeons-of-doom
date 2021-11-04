//
//  Item.swift
//  DeepDungeonsArturV2
//
//  Created by Artur Viader Mataix on 28/11/2018.
//  Copyright © 2018 Artur Viader Mataix. All rights reserved.
//

import Foundation
class Item
{
    var nombre:String
    var ataque:Int
    var defensa:Int
    var suerte:Int
    var magia:Int
    var tipo:String
    var precio:Int
    
    init(nombre:String,ataque:Int,defensa:Int,suerte:Int,tipo:String,precio:Int, magia:Int)
    {
        self.nombre = nombre
        self.ataque = ataque
        self.defensa = defensa
        self.suerte = suerte
        self.tipo = tipo
        self.precio = precio
        self.magia = magia
    }
}
