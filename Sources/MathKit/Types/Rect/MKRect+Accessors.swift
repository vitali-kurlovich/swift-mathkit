//
//  Created by Kurlovich Vitali on 9/23/26.
//

public extension MKRect {
    @inlinable var aspectRatio: Float {
        size.aspectRatio
    }
}

public extension MKRect {
    @inlinable var center: MKPoint<Float> {
        get {
            .init(x: midX, y: midY)
        }
        set {
            let offset = newValue - center
            origin += offset
        }
    }

    @inlinable var top: MKPoint<Float> {
        get {
            .init(x: midX, y: minY)
        }
        set {
            let offset = newValue - top
            origin += offset
        }
    }

    @inlinable var bottom: MKPoint<Float> {
        get {
            .init(x: midX, y: maxY)
        }

        set {
            let offset = newValue - bottom
            origin += offset
        }
    }
}

public extension MKRect {
    @inlinable var topLeft: MKPoint<Float> {
        get {
            .init(x: minX, y: minY)
        }
        set {
            let offset = newValue - topLeft
            origin += offset
        }
    }

    @inlinable var left: MKPoint<Float> {
        get {
            .init(x: minX, y: midY)
        }
        set {
            let offset = newValue - left
            origin += offset
        }
    }

    @inlinable var bottomLeft: MKPoint<Float> {
        get {
            .init(x: minX, y: maxY)
        }
        set {
            let offset = newValue - bottomLeft
            origin += offset
        }
    }
}

public extension MKRect {
    @inlinable var topRight: MKPoint<Float> {
        get {
            .init(x: maxX, y: minY)
        }
        set {
            let offset = newValue - topRight
            origin += offset
        }
    }

    @inlinable var right: MKPoint<Float> {
        get {
            .init(x: maxX, y: midY)
        }
        set {
            let offset = newValue - right
            origin += offset
        }
    }

    @inlinable var bottomRight: MKPoint<Float> {
        get {
            .init(x: maxX, y: maxY)
        }
        set {
            let offset = newValue - bottomRight
            origin += offset
        }
    }
}

public extension MKRect {
    @inlinable var x: Float {
        get {
            origin.x
        }
        set {
            origin.x = newValue
        }
    }

    @inlinable var y: Float {
        get {
            origin.y
        }
        set {
            origin.y = newValue
        }
    }

    @inlinable var width: Float {
        get {
            size.width
        }
        set {
            size.width = newValue
        }
    }

    @inlinable var height: Float {
        get {
            size.height
        }
        set {
            size.height = newValue
        }
    }
}

public extension MKRect {
    @inlinable var minX: Float {
        origin.x
    }

    @inlinable var minY: Float {
        origin.y
    }

    @inlinable var maxX: Float {
        origin.x + size.width
    }

    @inlinable var maxY: Float {
        origin.y + size.height
    }

    @inlinable var midX: Float {
        origin.x + size.width / 2
    }

    @inlinable var midY: Float {
        origin.y + size.height / 2
    }
}
