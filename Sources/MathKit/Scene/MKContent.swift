//
//  Created by Vitali Kurlovich on 20.04.2026.
//

public protocol MKContent {
    associatedtype Float: BinaryFloatingPoint & Sendable

    var extent: MKRect<Float> { get }

    func hitTest(_ point: MKPoint<Float>) -> Bool
}

public extension MKContent {
    func hitTest(_ point: MKPoint<Float>) -> Bool {
        extent.contains(point)
    }
}
