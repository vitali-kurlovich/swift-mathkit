//
//  Created by Kurlovich Vitali on 7/26/26.
//

public extension FrechetDistance {
    func distance<A: RandomAccessCollection, B: RandomAccessCollection>(pathA: A, pathB: B) -> R
        where A.Element == MKPoint<R>,
        B.Element == MKPoint<R>,
        A.Index == Int,
        B.Index == Int
    {
        distance(pathA: pathA, pathB: pathB) { $0.distance(to: $1)
        }
    }
}
