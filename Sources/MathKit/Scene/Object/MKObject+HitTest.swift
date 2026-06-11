//
//  Created by Vitali Kurlovich on 20.04.2026.
//

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
extension MKObject {
    func hitTest(_ point: MKPoint<Float>) -> Bool {
        let localPoint = local.appended(transform).inverse(point)
        return contentBounds.contains(point) && content.hitTest(localPoint)
    }
}
