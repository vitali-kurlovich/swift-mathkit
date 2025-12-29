//
//  Affine2DTransform+Accessors.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 29.12.25.
//

import Foundation

public extension Affine2DTransform {
    var m11: CGFloat {
        get {
            _transform.m11
        }
        set {
            _transform.m11 = newValue
        }
    }

    var m12: CGFloat {
        get {
            _transform.m12
        }
        set {
            _transform.m12 = newValue
        }
    }

    var m21: CGFloat {
        get {
            _transform.m21
        }
        set {
            _transform.m21 = newValue
        }
    }

    var m22: CGFloat {
        get {
            _transform.m22
        }
        set {
            _transform.m22 = newValue
        }
    }

    var tx: CGFloat {
        get {
            _transform.tX
        }
        set {
            _transform.tX = newValue
        }
    }

    var ty: CGFloat {
        get {
            _transform.tY
        }
        set {
            _transform.tY = newValue
        }
    }
}
