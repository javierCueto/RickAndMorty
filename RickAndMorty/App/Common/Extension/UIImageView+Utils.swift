//
//  UIImageView+Utils.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 16/01/23.
//

import UIKit

extension UIImageView {
    func setImageFromData(data: Data?) {
        if let data = data {
            if let image = UIImage(data: data) {
                self.image = image
            }
        }
    }
    
    func addDefaultImage() {
        image = UIImage(named: "default")
    }
}
