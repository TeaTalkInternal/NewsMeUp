//
//  UIImageView+Extensions.swift
//  NewsMeUp
//
//  Created by Randhir Kumar on 16/10/22.
//  Copyright © 2022 TuffyTiffany. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
}
