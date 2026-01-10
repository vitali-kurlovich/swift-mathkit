//
//  MKAffineTransform+Utils.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 6.01.26.
//

@testable import MathKit

import Foundation

extension MKAffineTransform {
    func isEqual(to other: Self, tolerance: CGFloat) -> Bool where Float == CGFloat {
        m11.isEqual(to: other.m11, tolerance: tolerance) &&
            m12.isEqual(to: other.m12, tolerance: tolerance) &&

            m21.isEqual(to: other.m21, tolerance: tolerance) &&
            m22.isEqual(to: other.m22, tolerance: tolerance) &&

            tx.isEqual(to: other.tx, tolerance: tolerance) &&
            ty.isEqual(to: other.ty, tolerance: tolerance)
    }
}
