//
//  Created by Vitali Kurlovich on 17.04.2026.
//

import Foundation

extension MKObject {
    var transform: MKAffineTransform<Float> {
        if _updateFlags.contains(.transform) {
            invalidateTransform()
            _updateFlags.remove(.transform)
        }
        return _transform
    }
}

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
