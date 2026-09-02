//
//  Created by Kurlovich Vitali on 9/2/26.
//

import CoreGraphics

public extension CGRect {
    @inlinable var aspectRatio: CGFloat {
        size.aspectRatio
    }
}

public extension CGRect {
    @inlinable var center: CGPoint {
        .init(x: midX, y: midY)
    }

    @inlinable var top: CGPoint {
        .init(x: midX, y: minY)
    }

    @inlinable var bottom: CGPoint {
        .init(x: midX, y: maxY)
    }
}

public extension CGRect {
    @inlinable var topLeft: CGPoint {
        .init(x: minX, y: minY)
    }

    @inlinable var left: CGPoint {
        .init(x: minX, y: midY)
    }

    @inlinable var bottomLeft: CGPoint {
        .init(x: minX, y: maxY)
    }
}

public extension CGRect {
    @inlinable var topRight: CGPoint {
        .init(x: maxX, y: minY)
    }

    @inlinable var right: CGPoint {
        .init(x: maxX, y: midY)
    }

    @inlinable var bottomRight: CGPoint {
        .init(x: maxX, y: maxY)
    }
}

public extension CGRect {
    @inlinable var x: CGFloat {
        origin.x
    }

    @inlinable var y: CGFloat {
        origin.y
    }

    @inlinable var width: CGFloat {
        size.width
    }

    @inlinable var height: CGFloat {
        size.height
    }
}
