//
//  MKSceneDebugView.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 20.04.2026.
//

#if canImport(SwiftUI)
    import SwiftUI

    struct MKSceneDebugConfiguration: Hashable {
        var showContentRect: Bool = true
        var showBounds: Bool = true
        var showContentBounds: Bool = true
        var showPivot: Bool = true

        var contentRectColor: Color = .green
        var contentRectFillColor: Color = .mint.opacity(0.2)

        var boundsColor: Color = .blue
        var contentBoundsColor: Color = .mint.opacity(0.6)

        var pivotAxisXColor: Color = .red
        var pivotAxisYColor: Color = .blue
    }

    struct MKSceneDebugView<Content: MKContent>: View where Content.Float == Double {
        @StateObject var scene: MKScene<Content>
        @Binding var configuration: MKSceneDebugConfiguration

        @Binding var point: MKPoint<Content.Float>?

        var body: some View {
            Canvas { context, _ in
                scene.updateIfNeeds()
                for object in scene.objects {
                    for child in object {
                        if let point {
                            drawContentRect(child, in: context, fill: child.hitTest(point))
                        } else {
                            drawContentRect(child, in: context)
                        }

                        drawBounds(child, in: context)
                        drawContentBounds(child, in: context)
                        drawPivot(child, in: context)
                    }
                }
            }
        }
    }

    private extension MKSceneDebugView {
        func drawContentRect(_ object: MKObject<Content>, in context: GraphicsContext, fill: Bool = false) {
            guard configuration.showContentRect else { return }

            let path = Path(object.cgContentPath)

            if fill {
                context.fill(path, with: .color(configuration.contentRectFillColor))
            }

            context.stroke(
                path,
                with: .color(configuration.contentRectColor),
                lineWidth: 1
            )
        }

        func drawBounds(_ object: MKObject<Content>, in context: GraphicsContext) {
            guard configuration.showBounds else { return }

            context.stroke(
                Path(object.cgBoundsPath),
                with: .color(configuration.boundsColor),
                lineWidth: 1
            )
        }

        func drawContentBounds(_ object: MKObject<Content>, in context: GraphicsContext) {
            guard configuration.showContentBounds else { return }

            context.stroke(
                Path(object.cgContentBoundsPath),
                with: .color(configuration.contentBoundsColor),
                lineWidth: 1
            )
        }

        func drawPivot(_ object: MKObject<Content>, in context: GraphicsContext) {
            guard configuration.showPivot else { return }

            context.stroke(
                Path(object.cgPivotX),
                with: .color(configuration.pivotAxisXColor),
                lineWidth: 1
            )

            context.stroke(
                Path(object.cgPivotY),
                with: .color(configuration.pivotAxisXColor),
                lineWidth: 1
            )
        }
    }

#endif
