//
//  Created by Vitali Kurlovich on 10.04.2026.
//

struct MKObjectFlagsUpdater<Content: MKContent> {
    func update(_ root: MKObject<Content>) {
        if root.flags != .none {
            for child in root.childs {
                child.updateFlags(root.flags)
            }
        }

        for child in root.childs {
            update(child)
        }
    }
}
