//
//  Created by Vitali Kurlovich on 16.04.2026.
//

#if canImport(SwiftUI)
    import SwiftUI

    struct MKSceneView<Content: MKContent>: View where Content.Float == Double {
        @StateObject var scene: MKScene<Content>

        @State private var point: MKPoint<Content.Float>?

        @State private var isDragging = false
        @State private var configuration = MKSceneDebugConfiguration()

        var drag: some Gesture {
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    self.isDragging = true

                    configuration.boundsColor = .cyan
                    point = .init(value.location)
                }
                .onEnded { _ in
                    self.isDragging = false
                    configuration.boundsColor = .blue
                    point = nil
                }
        }

        var body: some View {
            MKSceneDebugView(scene: scene, configuration: $configuration, point: $point)
                .gesture(drag)
        }
    }

    #Preview {
        @Previewable @StateObject var scene = MKScene([MKObject.example])

        @Previewable @State var angle = 0.0

        let startDate = Date.now

        VStack {
            MKSceneView(scene: scene)
           
            Text("Angle:\(angle)")
                .onChange(of: angle) {
                    scene.objects.first?.rotation = .degrees(angle)
                }

            Slider(value: $angle, in: 0 ... 360)
        }
    }

#endif
