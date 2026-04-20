//
//  Created by Vitali Kurlovich on 20.04.2026.
//

extension MKObject {
    func hitTest(_ point: MKPoint<Float>) -> Bool {
        let localPoint = local.appended(transform).inverse(point)
        return contentBounds.contains(point) && content.hitTest(localPoint)
    }
}
