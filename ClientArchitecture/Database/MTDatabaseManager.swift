//
//  MTDatabaseManager.swift
//  ClientArchitecture
//
//  Created by Astha Gupta on 1/22/18.
//  Copyright © 2018 Astha Gupta. All rights reserved.
//

import Foundation
import RealmSwift

final class MTDatabaseManager: Object, MTDatabaseService {
    func getObject<T>(objectType: T.Type, predicate: NSPredicate) -> T? where T : MTDatabaseObject {
        let results = try? Realm().objects(objectType).filter(predicate)
        return results?.last
    }
    
    func getList<T>(objectType: T.Type, predicate: NSPredicate) -> [T]? where T : MTDatabaseObject {
        let results = try? Realm().objects(objectType).filter(predicate)
        if let results = results {
            return Array(results)
        } else {
            return nil
        }
    }
    
    func getList<T>(objectType: T.Type, byIds ids: [String]) -> [T] where T : MTDatabaseObject {
        var results: [T] = []
        let realm = try? Realm()
        ids.forEach {
            if let object = realm?.object(ofType: objectType, forPrimaryKey: $0 as String) {
                results.append(object)
            }
        }
        return results
    }
    
    func getObject<T>(objectType: T.Type, byId id: String) -> T where T: MTDatabaseObject {
        let results = try? Realm().objects(objectType).filter(id)
        return (results?.last)!
    }
}

extension Realm {
    func safeWrite( block: (() -> Void)) {
        if self.isInWriteTransaction {
            block()
            do {
                try self.commitWrite()
            } catch {}
        } else {
            do {
                try self.write(block)
            } catch {}
        }
    }
}

extension Results {
    
}

