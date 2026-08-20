//
//  Created by Vitali Kurlovich on 04.04.2026.
//

import Foundation

public class MKObject<Content: MKContent> {
    public typealias Float = Content.Float

    public init(_ content: Content) {
        self.content = content
    }

    var observation: MKObjectObservation<Content>?

    let content: Content

    var _updateFlags: MKUpdateFlags = .all {
        didSet {
            if oldValue != _updateFlags {
                observation?.setNeedsUpdate(self)
            }
        }
    }

    var childs: [MKObject<Content>] = []
    weak var parent: MKObject<Content>?

    var _transformComponents = MKAffineTransformComponents<Float>() {
        didSet {
            guard oldValue != _transformComponents else { return }
            setTransformNeedsUpdate()
        }
    }

    var _contentTransformComponents = MKAffineTransformComponents<Float>() {
        didSet {
            guard oldValue != _contentTransformComponents else { return }
            setBoundsNeedsUpdate()
        }
    }

    var _transform: MKAffineTransform<Float> = .identity
    var _bounds: MKRect<Float> = .identity
    var _contentBounds: MKRect<Float> = .identity
}

extension MKObject {
    var root: MKObject {
        if let parent {
            return parent.root
        }

        return self
    }
}

extension MKObject {
    var contentOffset: MKVector<Float> {
        get {
            _contentTransformComponents.translation
        }
        set {
            _contentTransformComponents.translation = newValue
        }
    }

    var local: MKAffineTransform<Float> {
        _contentTransformComponents.inverseAffine
    }
}

extension MKObject {
    func setTransformNeedsUpdate() {
        updateFlags(.transform)
        setBoundsNeedsUpdate()
    }

    func setBoundsNeedsUpdate() {
        root.updateFlags(.bounds)
        root.updateFlags(.contentBounds)
    }

    func updateFlags(_ flags: MKUpdateFlags) {
        _updateFlags.formUnion(flags)
    }
}

extension MKObject {
    var flags: MKUpdateFlags {
        _updateFlags
    }

    var contentSize: MKSize<Float> {
        content.extent.size
    }

    var contentBounds: MKRect<Float> {
        if _updateFlags.contains(.contentBounds) {
            _contentBounds = content.extent.applying(local.appended(transform))
            _updateFlags.remove(.contentBounds)
        }

        return _contentBounds
    }

    var bounds: MKRect<Float> {
        if _updateFlags.contains(.bounds) {
            var bounds = contentBounds

            for child in childs {
                bounds = bounds.union(child.bounds)
            }

            _bounds = bounds
            _updateFlags.remove(.bounds)
        }
        return _bounds
    }
}

extension MKObject {
    func convert(_ point: MKPoint<Float>, from _: MKObject, to _: MKObject) -> MKPoint<Float> {
        point
    }
}

// MKObject+Transform

extension MKObject {
    var translation: MKVector<Float> {
        get {
            _transformComponents.translation
        }
        set {
            _transformComponents.translation = newValue
        }
    }

    var rotation: MKAngle<Float> {
        get {
            _transformComponents.rotation
        }
        set {
            _transformComponents.rotation = newValue
        }
    }

    var scale: MKSize<Float> {
        get {
            _transformComponents.scale
        }
        set {
            _transformComponents.scale = newValue
        }
    }
}
