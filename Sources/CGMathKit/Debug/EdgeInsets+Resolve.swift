//
//  Created by Kurlovich Vitali on 8/25/26.
//

import SwiftUI

extension EdgeInsets {
    func resolved(for direction: LayoutDirection) -> (top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        switch direction {
        case .leftToRight:
            return (top: top, left: leading, bottom: bottom, right: trailing)
        case .rightToLeft:
            return (top: top, left: trailing, bottom: bottom, right: leading)
        @unknown default:
            return (top: top, left: leading, bottom: bottom, right: trailing)
        }
    }
}
