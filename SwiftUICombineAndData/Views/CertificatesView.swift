//
//  CertificatesView.swift
//  SwiftUICombineAndData
//
//  Created by MANAS VIJAYWARGIYA on 27/10/21.
//

import SwiftUI

struct CertificatesView: View {
    // we have data in View model so we use = ViewModelName()
    // @StateObject property wrapper makes this instance of certificateVM a Subscriber to the @Published variable in the view model.
    @StateObject var certificateVM = CertificateViewModel()
    
    // MARK: - For checking network connection
    @StateObject var networkReachability = NetworkReachability()
    
    @State private var selection: Int = 0
    
    var body: some View {
        VStack {
            if networkReachability.reachable {
                // TabView code...
                if certificateVM.certificates.count > 0 {
                    TabView(selection: $selection) {
                        ForEach(certificateVM.certificates.indices, id: \.self) { index in
                            CertificateCard(selection: $selection)
                                .environmentObject(certificateVM)
                                .padding(.horizontal, 8)
                        }
                    }
                    //        .tabViewStyle(.page)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                } else {
                    ProgressView()
                }
                //        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                //        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            } else {
                Text("Please connect to the Internet to see your certificates.")
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .background(AccountBackground())
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}
