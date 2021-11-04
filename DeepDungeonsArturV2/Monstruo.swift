//
//  Monstruo.swift
//  DeepDungeonsArturV2
//
//  Created by Artur Viader Mataix on 28/11/2018.
//  Copyright © 2018 Artur Viader Mataix. All rights reserved.
//

import Foundation

class Monstruo
{
    var nombre:String
    var ataque:Int
    var exp:Int
    var dinero:Int
    var imagen:String
    var vida:Int
  
    func getnumdados() -> Int
    {
        var dados:Int
        if ataque<=10
        {
            dados = 1
        }
        else if(ataque>10 && ataque<=25)
        {
            dados = 2
        }
        else
        {
            dados = 3
        }
        return dados
    }
    
    init(nombre:String,ataque:Int,exp:Int,dinero:Int,imagen:String, vida:Int)
    {
        self.nombre = nombre
        self.ataque = ataque
        self.exp = exp
        self.dinero = dinero
        self.imagen = imagen
        self.vida = vida
    }
}
