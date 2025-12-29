//
//  AffineTransform+Affine2DTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 29.12.25.
//

import Foundation

public extension AffineTransform {
    init(_ affine: Affine2DTransform) {
        self = affine._transform
    }
}
