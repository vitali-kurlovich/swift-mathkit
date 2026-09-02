//
//  Created by Kurlovich Vitali on 9/2/26.
//

import Foundation

public extension CGSize {
    @inlinable var aspectRatio: CGFloat {
        width / height
    }
}
