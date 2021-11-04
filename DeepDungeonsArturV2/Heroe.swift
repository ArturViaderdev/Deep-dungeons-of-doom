//
//  Heroe.swift
//  DeepDungeonsArturV2
//
//  Created by Artur Viader Mataix on 28/11/2018.
//  Copyright © 2018 Artur Viader Mataix. All rights reserved.
//

import Foundation
class Heroe
{
    var vida:Int
    var nombre:String
    var dinero:Int
    var experiencia:Int
    var stuff:Stuff
    
    var imagen:String
    

    func getnumdados() -> Int
    {
        var dados:Int
        var ataque:Int = getdano()
        
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
    
    init(nombre:String,vida:Int,dinero:Int,experiencia:Int, imagen:String)
    {
        self.nombre = nombre
        self.vida = vida
        self.dinero = dinero
        self.experiencia = experiencia
        self.imagen = imagen
        self.stuff = Stuff()
    }
    
    func getdano () -> Int{
        var ataque:Int
        var defensa:Int
        var magia:Int
        var suerte:Int
        ataque = stuff.getataque()
        defensa = stuff.getdefensa()
        magia = stuff.getmagia()
        suerte = stuff.getsuerte()
        
        return (ataque + defensa + magia + suerte) / 4
    }
}
