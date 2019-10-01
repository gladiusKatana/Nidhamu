// ArchiveBlock     ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
import UIKit


struct ArchiveBlock<T: Hashable, U: Hashable, V: Hashable, W: Hashable>: Hashable {

    let values : (T, U, V, W)
    func hash(into hasher: inout Hasher) {
        let (a,b,c,d) = values
        hasher.combine(a.hashValue &* 31 &+ b.hashValue &* 31 &+ c.hashValue &* 31 &+ d.hashValue)
    }
}

func ==<T:Hashable,U:Hashable,V:Hashable,W:Hashable>(lhs: ArchiveBlock<T,U,V,W>,
                                                     rhs: ArchiveBlock<T,U,V,W>) -> Bool {   /// comparison function for conforming to Equatable protocol
    return lhs.values == rhs.values
}

