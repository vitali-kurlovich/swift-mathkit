//
//  Created by Vitali Kurlovich on 06.04.2026.
//

public extension MKRect {
    @inlinable func projected(_ unit: MKUnitPoint<Float>) -> MKPoint<Float> {
        origin + size.projected(unit)
    }
}
