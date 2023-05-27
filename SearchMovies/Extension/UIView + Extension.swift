//
//  UIView + Extension.swift
//  SearchMovies
//
//  Created by Jadiê on 27/05/23.
//

import Foundation
import UIKit


extension UIView {
    public func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor)
        ])
    }
}
