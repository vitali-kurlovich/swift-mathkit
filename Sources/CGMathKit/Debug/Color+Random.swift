//
//  Created by Kurlovich Vitali on 8/25/26.
//

import SwiftUI

extension Color {
    static func random() -> Color {
        let colors: [Color] = [
            .red,
            .orange,
            .yellow,
            .green,
            .mint,
            .teal,
            .cyan,
            .blue,
            .indigo,
            .purple,
            .pink,
            .brown,
            // .white,
            .gray,
            // .black
        ]

        return colors.randomElement()!
    }
}
