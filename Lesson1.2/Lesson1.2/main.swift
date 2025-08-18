//
//  main.swift
//  Lesson1.2
//
//  Created by Batuhan Gözegü on 18.08.2025.
//

import Foundation
// Hesap Makinesi
enum islemler {
    
    case toplama
    case cikarma
    case carpma
    case bolme
    
}

func hesapla(sayi1:Double, sayi2:Double, islem:islemler) -> Double? {
    
    switch islem {

    case .toplama: return sayi1 + sayi2
    case .cikarma: return sayi1 - sayi2
    case .carpma: return sayi1 * sayi2
    case .bolme: return sayi2 == 0 ? nil : sayi1 / sayi2

    }
    
}

print ("3 + 5 =", hesapla(sayi1: 3, sayi2: 5, islem: .toplama)!)
print ("10 - 2 =", hesapla(sayi1: 10, sayi2: 2, islem: .cikarma)!)
print ("4 * 5 =", hesapla(sayi1: 4, sayi2: 5, islem: .carpma)!)
print ("21 / 7 =", hesapla(sayi1: 21, sayi2: 7, islem: .bolme)!)

if hesapla(sayi1: 24, sayi2: 0, islem: .bolme) == nil {
    print("Sıfıra bölünmez")
}
 


/*
                 CLOSURE İLE FİLTRELEME VE SIRALAMA
 */

let sayilar = [21, 5, 1, 8, 2, 13, 4, 9, 17, 10]

let ciftler = sayilar.filter { $0 % 2 == 0 }
print ("Çift Sayılar:", ciftler)

let tekler = sayilar.filter { $0 % 2 != 0 }
print("Tek Sayılar:", tekler)

let kucuktenbuyuge = sayilar.sorted { $1 > $0}
print("Küçükten büyüğe:", kucuktenbuyuge)

let buyuktenkucuge = sayilar.sorted{ $0 > $1}
print("Büyükten küçüğe:", buyuktenkucuge)
