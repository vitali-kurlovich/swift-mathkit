//
//  File.metal
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 2.01.26.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;


[[ stitchable ]] half4 checkerboard(float2 position, half4 currentColor, float checkSize, float opacity) {
    // A view will consist of a certain number of checkers in the x and y direction
    // posInChecks gives which checker will the given pixel belongs to.
    uint2 posInChecks = uint2(position.x / checkSize, position.y / checkSize);
    bool isOpaque = (posInChecks.x ^ posInChecks.y) & 1;
    return  isOpaque ? currentColor * opacity : currentColor;
}
