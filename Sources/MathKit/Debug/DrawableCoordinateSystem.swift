//
//  Created by Kurlovich Vitali on 8/25/26.
//

#if canImport(SwiftUI)

    import SwiftUI

    struct DrawableCoordinateSystem: Drawable {
        let label: String
        let drawables: [any Drawable]

        let layoutDirection: LayoutDirection
        let insets: EdgeInsets

        let transform: CGAffineTransform

        init(
            label: String,
            drawables: [any Drawable],
            layoutDirection: LayoutDirection,
            insets: EdgeInsets,
            transform: CGAffineTransform = .identity
        ) {
            self.label = label
            self.drawables = drawables
            self.layoutDirection = layoutDirection
            self.insets = insets
            self.transform = transform
        }

        func draw(_ ctx: GraphicsContext) {
            var context = ctx
            context.transform = contentTransform.concatenating(transform)

            drawAxis(context)

            for drawable in drawables {
                drawable.draw(context)
            }

            if label.isEmpty == false {
                let text = Text(label)
                    .font(.subheadline)
                    .foregroundStyle(.primary)

                let x = bounds.midX
                let y = bounds.maxY

                context.transform = contentTransform
                context.draw(text, at: CGPoint(x: x, y: y), anchor: .bottom)
            }

            if bounds.isNull == false {
                context.transform = contentTransform
                context.stroke(Path(bounds), with: .foreground)
            }
        }

        var bounds: CGRect {
            let bounds = contentBounds

            let (top, left, bottom, right) = insets.resolved(for: layoutDirection)

            let minX = bounds.minX - left
            let maxX = bounds.maxX + right

            let minY = bounds.minY - top
            let maxY = bounds.maxY + bottom

            return .init(x: minX, y: minY, width: maxX - minX, height: maxY - minY)
        }
    }

    private extension DrawableCoordinateSystem {
        var contentTransform: CGAffineTransform {
            let bounds = bounds
            return .identity.translatedBy(x: -bounds.minX, y: -bounds.minY)
        }

        var contentBounds: CGRect {
            var iterator = drawables.makeIterator()

            guard var drawable = iterator.next() else {
                return CGRect.null
            }

            var bounds = drawable.bounds

            while let drawable = iterator.next() {
                bounds = bounds.union(drawable.bounds)
            }

            return bounds
        }

        func drawAxis(_ context: GraphicsContext) {
            let bounds = bounds.applying(contentTransform)

            let xAxis = CGHorizontalLine(y: 0).applying(context.transform)
            let yAxis = CGVerticalLine(x: 0).applying(context.transform)

            var context = context
            context.transform = .identity

            let style: StrokeStyle = .init(dash: [3, 5])

            if let segment = xAxis.intersection(bounds) {
                var xAxis = Path()
                xAxis.move(to: segment.point1)
                xAxis.addLine(to: segment.point2)

                context.stroke(xAxis, with: .color(.red), style: style)
            }

            if let segment = yAxis.intersection(bounds) {
                var yAxis = Path()
                yAxis.move(to: segment.point1)
                yAxis.addLine(to: segment.point2)

                context.stroke(yAxis, with: .color(.green), style: style)
            }
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
                .transform(.init(rotationAngle: 0.2))
        }
    }

#endif
