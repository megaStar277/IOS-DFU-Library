/*
* Copyright (c) 2022, Nordic Semiconductor
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without modification,
* are permitted provided that the following conditions are met:
*
* 1. Redistributions of source code must retain the above copyright notice, this
*    list of conditions and the following disclaimer.
*
* 2. Redistributions in binary form must reproduce the above copyright notice, this
*    list of conditions and the following disclaimer in the documentation and/or
*    other materials provided with the distribution.
*
* 3. Neither the name of the copyright holder nor the names of its contributors may
*    be used to endorse or promote products derived from this software without
*    specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
* IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
* INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
* NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
* PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
* WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
* ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
* POSSIBILITY OF SUCH DAMAGE.
*/

import SwiftUI

enum DfuUiStateStatus {
    case idle
    case success
    case progress
    case error
}

struct StatusItemView: View {
    let text: String
    let status: DfuUiStateStatus
    
    var body: some View {
        HStack {
            Image(status.image)
                .renderingMode(.template)
                .foregroundColor(status.color)
                .frame(width: 24, height: 24)
                .padding(.horizontal)
            Text(text)
            Spacer()
        }
    }
}

private extension DfuUiStateStatus {
    
    var image: String {
        switch self {
        case .idle:
            return DfuImages.idle.imageName
        case .success:
            return DfuImages.success.imageName
        case .progress:
            return DfuImages.progress.imageName
        case .error:
            return DfuImages.error.imageName
        }
    }

    var color: Color {
        switch self {
        case .idle:
            return ThemeColor.nordicDarkGray5.color
        case .success:
            return ThemeColor.nordicGreen.color
        case .progress:
            return ThemeColor.nordicDarkGray5.color
        case .error:
            return ThemeColor.error.color
        }
    }
    
}

struct StatusItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StatusItemView(text: "Load", status: .idle)
            StatusItemView(text: "Loading...", status: .progress)
            StatusItemView(text: "Success", status: .success)
            StatusItemView(text: "Error", status: .error)
        }
    }
}
