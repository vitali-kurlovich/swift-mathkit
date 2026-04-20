//
//  Created by Vitali Kurlovich on 13.04.2026.
//

#if canImport(CoreGraphics)

    import CoreGraphics

    struct ExampleContent: MKContent {
        typealias Float = Double

        let extent: MKRect<Double>

        init(extent: MKRect<Double>) {
            self.extent = extent
        }

        init(_ rect: CGRect) {
            self.init(extent: .init(rect))
        }

        init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
            let rect = CGRect(x: x, y: y, width: width, height: height)
            self.init(rect)
        }
    }

    extension MKObject where Content == ExampleContent {
        static var example: MKObject<ExampleContent> {
            let object = MKObject<ExampleContent>(ExampleContent(x: 0, y: 0, width: 60, height: 40))

            object.translation = .init(dx: 200, dy: 160)
            object.contentOffset = .init(dx: 30, dy: 20)

            let child1 = MKObject(ExampleContent(x: -10, y: -10, width: 20, height: 20))

            child1.translation = .init(dx: 0, dy: 65)

            object.add(child: child1)

            let child2 = MKObject(ExampleContent(x: -10, y: -10, width: 20, height: 20))

            child2.translation = .init(dx: 30, dy: 65)
            child2.rotation = .degrees(30)

            object.add(child: child2)

            let child3 = MKObject(ExampleContent(x: -10, y: -10, width: 20, height: 20))

            child3.translation = .init(dx: -30, dy: 65)
            child3.rotation = .degrees(20)

            object.add(child: child3)

            let child4 = MKObject(ExampleContent(x: -10, y: -10, width: 20, height: 20))

            child4.translation = .init(dx: 0, dy: 35)
            child4.rotation = .degrees(20)

            child3.add(child: child4)

            return object
        }
    }

#endif
