//
//  Created by Vitali Kurlovich on 13.04.2026.
//

#if canImport(CoreGraphics)

    import CoreGraphics
    import SwiftUI

    extension MKObject where Content.Float == Double {
        var cgContentPath: CGPath {
            var transform = CGAffineTransform(local.appended(transform)) // CGAffineTransform(transform)

            let rect = CGRect(content.extent)

            return CGPath(rect: rect, transform: &transform)
        }

        var cgBoundsPath: CGPath {
            var transform = CGAffineTransform.identity
            let rect = CGRect(bounds)
            return CGPath(rect: rect, transform: &transform)
        }

        var cgContentBoundsPath: CGPath {
            var transform = CGAffineTransform.identity
            let rect = CGRect(contentBounds)
            return CGPath(rect: rect, transform: &transform)
        }

        var cgPivotX: CGPath {
            let pivot = transform.pivot * 10

            let p = pivot.center + pivot.x

            let path = CGMutablePath()
            path.move(to: .init(pivot.center))
            path.addLine(to: .init(p))

            return path
        }

        var cgPivotY: CGPath {
            let pivot = transform.pivot * 10

            let p = pivot.center + pivot.y

            let path = CGMutablePath()
            path.move(to: .init(pivot.center))
            path.addLine(to: .init(p))

            return path
        }
    }

#endif
