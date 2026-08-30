//
//  Created by Kurlovich Vitali on 8/25/26.
//

#if canImport(SwiftUI)

    import SwiftUI

    struct CoordinateSystemView: View {
        @Environment(\.layoutDirection)
        private var layoutDirection

        let label: String
        let drawables: [any Drawable]
        let edgeInsets: EdgeInsets

        let transform: CGAffineTransform

        init(label: String = "",
             _ drawables: [any Drawable],
             edgeInsets: EdgeInsets = .init(top: 20, leading: 20, bottom: 20, trailing: 20),
             transform: CGAffineTransform = .identity)
        {
            self.label = label
            self.drawables = drawables
            self.edgeInsets = edgeInsets
            self.transform = transform
        }

        var body: some View {
            DrawableView(drawable: coordinateSystem)
        }
    }

    extension CoordinateSystemView {
        init(label: String = "", edgeInsets: EdgeInsets = .init(top: 20, leading: 20, bottom: 20, trailing: 20), transform: CGAffineTransform = .identity) {
            self.init(label: label, [], edgeInsets: edgeInsets, transform: transform)
        }

        init(label: String = "", _ drawable: any Drawable, edgeInsets: EdgeInsets = .init(top: 20, leading: 20, bottom: 20, trailing: 20), transform: CGAffineTransform = .identity) {
            self.init(
                label: label,
                [drawable],
                edgeInsets: edgeInsets,
                transform: transform
            )
        }
    }

    extension CoordinateSystemView {
        func label(_ label: String) -> Self {
            .init(
                label: label,
                drawables,
                edgeInsets: edgeInsets,
                transform: transform
            )
        }

        func edgeInsets(_ edgeInsets: EdgeInsets) -> Self {
            .init(label: label, drawables, edgeInsets: edgeInsets,
                  transform: transform)
        }
    }

    extension CoordinateSystemView {
        func transform(_ transform: CGAffineTransform) -> Self {
            .init(label: label, drawables, edgeInsets: edgeInsets,
                  transform: transform)
        }
    }

    extension CoordinateSystemView {
        func plot(_ drawable: any Drawable) -> Self {
            plot([drawable])
        }

        func plot(_ drawables: [any Drawable]) -> Self {
            .init(label: label, drawables, edgeInsets: edgeInsets)
        }

        func appendPlot(_ drawable: any Drawable) -> Self {
            appendPlot([drawable])
        }

        func appendPlot(_ drawables: [any Drawable]) -> Self {
            var dr = self.drawables
            dr.append(contentsOf: drawables)
            return .init(label: label, dr, edgeInsets: edgeInsets)
        }
    }

    private extension CoordinateSystemView {
        var coordinateSystem: DrawableCoordinateSystem {
            DrawableCoordinateSystem(
                label: label,
                drawables: drawables,
                layoutDirection: layoutDirection,
                insets: edgeInsets,
                transform: transform
            )
        }
    }

    #Preview {
        let rect1 = DrawableRect(
            CGRect(x: 0, y: 0, width: 200, height: 150),
            color: .yellow
        )

        let rect2 = DrawableRect(
            CGRect(x: -30, y: -20, width: 100, height: 250),
            color: .indigo
        )

        let rect3 = DrawableRect(
            CGRect(x: 130, y: 120, width: 350, height: 90)
        )

        HStack {
            CoordinateSystemView()
                .edgeInsets(.init(top: 32, leading: 32, bottom: 22, trailing: 32))
                .label("Axis")
                .plot([rect1, rect2])
                .appendPlot(rect3)
                .transform(.init(rotationAngle: 0.1))
        }
    }

#endif
