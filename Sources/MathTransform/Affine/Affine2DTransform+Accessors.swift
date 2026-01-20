//
//  Affine2DTransform+Accessors.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 29.12.25.
//

import Foundation

public extension Affine2DTransform {
    var m11: Float {
        get {
            _transform.m11
        }
        set {
            _transform.m11 = newValue
        }
    }

    var m12: Float {
        get {
            _transform.m12
        }
        set {
            _transform.m12 = newValue
        }
    }

    var m21: Float {
        get {
            _transform.m21
        }
        set {
            _transform.m21 = newValue
        }
    }

    var m22: Float {
        get {
            _transform.m22
        }
        set {
            _transform.m22 = newValue
        }
    }

    var tx: Float {
        get {
            _transform.tx
        }
        set {
            _transform.tx = newValue
        }
    }

    var ty: Float {
        get {
            _transform.ty
        }
        set {
            _transform.ty = newValue
        }
    }
}
