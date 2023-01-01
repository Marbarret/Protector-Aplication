//
//  Discovery.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 22/12/22.
//

import UIKit

struct Discovery {
    var name: String
    var image: UIImage?
}

var discovery: [Discovery] = [
    Discovery(name: "Informacoes", image: UIImage(named: "icon-1")),
    Discovery(name: "Denuncia", image: UIImage(named: "icon-2")),
    Discovery(name: "Denuncia", image: UIImage(named: "icon-3")),
    Discovery(name: "Denuncia", image: UIImage(named: "icon-4")),
]


struct Posts {
    var category: String
    var image: UIImage?
    var resume: String
    var data: String
}

var postsData: [Posts] = [
    Posts(category: "TECHNOLOGY", image: UIImage(named: "img2"), resume: "Well, well, well, how the turntables", data: "Nov 4"),
    Posts(category: "TECHNOLOGY", image: UIImage(named: "img1"), resume: "Well, well, well, how the turntables", data: "Nov 4"),
    Posts(category: "TECHNOLOGY", image: UIImage(named: "img2"), resume: "Well, well, well, how the turntables", data: "Nov 4"),
]
