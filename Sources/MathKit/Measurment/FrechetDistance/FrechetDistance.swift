//
//  Created by Kurlovich Vitali on 7/26/26.
//

public struct FrechetDistance<R: Numeric & Comparable & Sendable>: Sendable {
    public var maxThreshold: R

    public init(maxThreshold: R) {
        self.maxThreshold = maxThreshold
    }
}

public extension FrechetDistance {
    func distance<P, A: RandomAccessCollection, B: RandomAccessCollection>(pathA: A, pathB: B, distanceBetween: (P, P) -> R) -> R
        where A.Element == P,
        A.Index == Int,
        B.Element == P,
        B.Index == Int
    {
        if pathA.isEmpty || pathA.isEmpty {
            return .zero
        }

        let countA = pathA.count

        // Use a dictionary, since pruning will eliminate most of the space used in a countA x countB array.
        var memoizedDFD: [Int: R] = [:]

        func recursiveDFD(indexA: Int, indexB: Int, maxThreshold: R) -> R {
            let memoizedIndex = indexA + countA * indexB
            // Check that the value has not already been solved.
            if let existingResult = memoizedDFD[memoizedIndex] {
                return existingResult
            }

            let result: R

            let pointPairDistance = distanceBetween(pathA[indexA], pathB[indexB])

            if indexA == pathA.startIndex, indexB == pathB.startIndex {
                // If just checking the first two points, the cost is the distance between the points.
                result = pointPairDistance
            } else if pointPairDistance > maxThreshold {
                // Exit early if this value will never be used, this prunes the search tree.
                result = pointPairDistance
            } else if indexB == pathB.startIndex {
                // If at the start of path B, move towards the start of path A.
                result = Swift.max(recursiveDFD(indexA: indexA - 1, indexB: pathB.startIndex, maxThreshold: maxThreshold), pointPairDistance)
            } else if indexA == pathA.startIndex {
                // If at the start of path A, move towards the start of path B.
                result = Swift.max(recursiveDFD(indexA: pathA.startIndex, indexB: indexB - 1, maxThreshold: maxThreshold), pointPairDistance)
            } else {
                // Return the minimum of moving towards the start of A, B, or A & B.
                let diagonalDFD = recursiveDFD(indexA: indexA - 1, indexB: indexB - 1, maxThreshold: maxThreshold)
                let leftDFD = recursiveDFD(indexA: indexA - 1, indexB: indexB, maxThreshold: Swift.min(maxThreshold, diagonalDFD))
                let downDFD = recursiveDFD(indexA: indexA, indexB: indexB - 1, maxThreshold: Swift.min(maxThreshold, leftDFD, diagonalDFD))
                let minOfRecursion = Swift.min(leftDFD, diagonalDFD, downDFD)
                result = Swift.max(minOfRecursion, pointPairDistance)
            }

            memoizedDFD[memoizedIndex] = result
            return result
        }

        return recursiveDFD(
            indexA: pathA.endIndex - 1,
            indexB: pathB.endIndex - 1,
            maxThreshold: maxThreshold
        )
    }
}
