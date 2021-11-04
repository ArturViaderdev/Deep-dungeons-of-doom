//
//  Stuff.swift
//  DeepDungeonsArturV2
//
//  Created by Artur Viader Mataix on 28/11/2018.
//  Copyright © 2018 Artur Viader Mataix. All rights reserved.
//

import Foundation
class Stuff
{
    var items : Dictionary = [String:Item]()
    init ()
    {
        
    }
    
    func recuperaritem(tipo:String) -> Item
    {
        return ((items[tipo] ?? Item(nombre: "preset_backpack", ataque: 0, defensa: 0, suerte: 0, tipo: "nil", precio: 0, magia: 0)))
    }
    
    func insertaitem(item:Item)
    {
        items[item.tipo] = item
    }
    
    func getataque() -> Int
    {
        var suma:Int = 0;
        print(items.count)
        for item in items.values
        {
            print(item.ataque)
            suma += item.ataque
        }
        return suma
    }
    
    func getdefensa() -> Int
    {
        var suma:Int = 0;
        for item in items.values
        {
            suma += item.defensa
        }
        return suma
    }
    
    func getmagia() -> Int
    {
        var suma:Int = 0;
        for item in items.values
        {
            suma += item.magia
        }
        return suma
    }
    
    func getsuerte() -> Int
    {
        var suma:Int = 0;
        for item in items.values
        {
            suma += item.ataque
        }
        return suma
    }
    
}
