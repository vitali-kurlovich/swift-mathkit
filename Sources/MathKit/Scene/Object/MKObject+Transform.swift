//
//  Created by Vitali Kurlovich on 17.04.2026.
//

import Foundation

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
extension MKObject {
    var transform: MKAffineTransform<Float> {
        if _updateFlags.contains(.transform) {
            invalidateTransform()
            _updateFlags.remove(.transform)
        }
        return _transform
    }
}

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
private extension MKObject {
    func invalidateTransform() {
        let affine = _transformComponents.affine

        if let parent {
            var tr = parent.transform
            tr.prepend(affine)
            _transform = tr
        } else {
            _transform = affine
        }
    }
}
