//
//  Created by Kurlovich Vitali on 8/25/26.
//

import SwiftUI

protocol Drawable {
    var bounds: CGRect { get }
    var size: CGSize { get }

    func draw(_ context: GraphicsContext)
}

extension Drawable {
    var size: CGSize {
        bounds.size
    }
}
