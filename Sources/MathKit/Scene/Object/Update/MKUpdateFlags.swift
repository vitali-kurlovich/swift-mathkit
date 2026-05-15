//
//  Created by Vitali Kurlovich on 10.04.2026.
//

struct MKUpdateFlags: OptionSet {
    var rawValue: UInt8

    static var none: Self {
        .init(rawValue: 0)
    }

    static var transform: Self {
        .init(rawValue: 1 << 0)
    }

    static var bounds: Self {
        .init(rawValue: 1 << 1)
    }

    static var contentBounds: Self {
        .init(rawValue: 1 << 2)
    }

    static var all: Self {
        [.transform, .bounds, .contentBounds]
    }
}
