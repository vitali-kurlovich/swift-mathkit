//
//  Created by Vitali Kurlovich on 16.04.2026.
//

#if canImport(Combine)
    import Combine

    extension MKScene: ObservableObject {}

#endif

protocol MKSceneDelegate<Content>: AnyObject {
    associatedtype Content: MKContent
    func sceneDidChange(_ scene: MKScene<Content>)
}

class MKScene<Content> where Content: MKContent {
    #if canImport(Combine)
        let objectWillChange = ObservableObjectPublisher()

    #endif

    init(_ objects: [MKObject<Content>] = []) {
        self.objects = objects
        needsUpdate = true

        observer = .init()

        for object in objects {
            object.register(observation: observer)
        }

        observer.delegate = self
    }

    weak var delegate: (any MKSceneDelegate<Content>)?

    private(set) var objects: [MKObject<Content>]

    private var needsUpdate: Bool {
        didSet {
            guard oldValue != needsUpdate else { return }
            notifySceneDidChange()
        }
    }

    private let observer: MKObjectObservation<Content>
}

private extension MKScene {
    func notifySceneDidChange() {
        delegate?.sceneDidChange(self)

        #if canImport(Combine)
            objectWillChange.send()

        #endif
    }
}

extension MKScene {
    func setNeedsUpdate() {
        needsUpdate = true
    }

    func updateIfNeeds() {
        guard needsUpdate else { return }

        let updater = MKObjectFlagsUpdater<Content>()

        for object in objects {
            updater.update(object)
        }

        needsUpdate = false
    }
}

extension MKScene {
    func contains(_ object: MKObject<Content>) -> Bool {
        objects.contains { object === $0 }
    }

    func append(_ object: MKObject<Content>) {
        assert(!contains(object))

        objects.append(object)

        object.register(observation: observer)
    }

    func remove(_ object: MKObject<Content>) {
        assert(contains(object))

        let index = objects.firstIndex { $0 === object }

        if let index {
            objects.remove(at: index)
            object.removeObservation()
        }
    }
}

extension MKScene: MKObjectObservationDelegate<Content> {
    func observation(_: MKObjectObservation<Content>, didChangeObject _: MKObject<Content>) {
        setNeedsUpdate()
    }
}
