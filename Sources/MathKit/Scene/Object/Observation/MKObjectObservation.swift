//
//  Created by Vitali Kurlovich on 16.04.2026.
//

protocol MKObjectObservationDelegate<Content>: AnyObject {
    associatedtype Content: MKContent
    func observation(_ observation: MKObjectObservation<Content>, didChangeObject: MKObject<Content>)
}

final class MKObjectObservation<Content: MKContent> {
    weak var delegate: (any MKObjectObservationDelegate<Content>)?

    func setNeedsUpdate(_ object: MKObject<Content>) {
        delegate?.observation(self, didChangeObject: object)
    }
}
