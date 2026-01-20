//
//  MKAffineTransform+Affine2DTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 29.12.25.
//

import MathKit

public extension MKAffineTransform {
    init(_ affine: Affine2DTransform<Float>) {
        self = affine._transform
    }
}
