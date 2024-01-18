//
//  SharedStateApp.swift
//  SharedState
//
//  Created by 柿崎逸 on 2024/01/13.
//

import SwiftUI

@main
struct SharedStateApp: App {
    var body: some Scene {
        WindowGroup {
            //            SharedStateView(store: .init(initialState: SharedState.State()) {
            //                SharedState()
            //            })
            PrentView(store: .init(initialState: Prent.State(), reducer: {
                Prent()
            }))
//            let sharedData = Share.ShareData(isFirstUser: false) // isFirstUserの初期値を設定
//            // Share.Stateの初期状態を作成
//            let initialState = Share.State.initial(sharedData: sharedData)
//            // ShareViewに初期状態とreducerを渡す
//            ShareView(store: .init(initialState: initialState, reducer: { Share() }))
        }
    }
}
