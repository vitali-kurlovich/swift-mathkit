//
//  Created by Vitali Kurlovich on 13.04.2026.
//

public struct MKObjectIterator<Content: MKContent>: IteratorProtocol {
    private var stack: [MKObject<Content>] = []

    public init(_ root: MKObject<Content>) {
        stack = [root]
    }

    public mutating func next() -> MKObject<Content>? {
        guard let last = stack.popLast() else {
            return nil
        }

        stack.append(contentsOf: last.childs.reversed())

        return last
    }
}

extension MKObject: Sequence {
    public func makeIterator() -> MKObjectIterator<Content> {
        MKObjectIterator(self)
    }
}
