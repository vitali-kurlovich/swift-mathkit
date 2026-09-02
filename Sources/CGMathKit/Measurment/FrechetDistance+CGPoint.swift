//
//  Created by Kurlovich Vitali on 7/26/26.
//

public import MathKit
import Foundation

public extension FrechetDistance where R == CGFloat {
    func distance<A: RandomAccessCollection, B: RandomAccessCollection>(pathA: A, pathB: B) -> R
        where A.Element == CGPoint,
        B.Element == CGPoint,
        A.Index == Int,
        B.Index == Int
    {
        distance(pathA: pathA, pathB: pathB) { MKPoint($0).distance(to: MKPoint($1)) }
    }
}
