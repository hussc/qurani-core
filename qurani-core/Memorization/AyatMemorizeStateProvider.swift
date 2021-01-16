//
//  AyatMemorizeStateProvider.swift
//  Qurani
//
//  Created by Hussein AlRyalat on 9/14/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public enum AyaState {
    case completed
    case uncompleted
}

public protocol AyatMemorizeStateProvider {
    func state(for aya: Aya) -> AyaState
    func set(state: AyaState, for aya: Aya)
}

public extension AyatMemorizeStateProvider {
    func state(for ayat: [Aya]) -> AyaState {
        return ayat.filter { self.state(for: $0) == .uncompleted }.count == 0 ? .completed : .uncompleted
    }
    
    func set(state: AyaState, for ayat: [Aya]){
        ayat.forEach { (aya) in
            self.set(state: state, for: aya)
        }
    }
}
