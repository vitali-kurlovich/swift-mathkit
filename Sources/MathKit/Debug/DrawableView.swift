//
//  Created by Kurlovich Vitali on 8/25/26.
//

#if canImport(SwiftUI)

    import SwiftUI

    struct DrawableView: View {
        let drawable: any Drawable

        var body: some View {
            Canvas { context, _ in
                drawable.draw(context)

            }.frame(width: drawable.bounds.width, height: drawable.bounds.height)
        }
    }

#endif
