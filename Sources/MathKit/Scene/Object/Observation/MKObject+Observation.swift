//
//  Created by Vitali Kurlovich on 16.04.2026.
//

extension MKObject {
    func register(observation: MKObjectObservation<Content>) {
        self.observation = observation

        for child in childs {
            child.register(observation: observation)
        }
    }

    func removeObservation() {
        observation = nil

        for child in childs {
            child.removeObservation()
        }
    }
}
