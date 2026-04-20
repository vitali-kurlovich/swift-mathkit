//
//  Created by Vitali Kurlovich on 14.04.2026.
//

public extension MKObject {
    func remove(child: MKObject<Content>) {
        let index = childs.firstIndex { $0 === child }

        if let index {
            updateFlags([.bounds])
            childs.remove(at: index)
            removeParent()
        }
    }

    func add(child: MKObject<Content>) {
        childs.append(child)
        child.setParent(self)
    }
}

extension MKObject {
    func setParent(_ parent: MKObject<Content>) {
        self.parent = parent
        setTransformNeedsUpdate()

        if let observation = parent.observation {
            register(observation: observation)
        }
    }

    func removeParent() {
        parent = nil

        removeObservation()
    }
}
