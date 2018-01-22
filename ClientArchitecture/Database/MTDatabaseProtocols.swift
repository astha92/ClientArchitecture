//
//  MTDatabaseProtocols.swift
//  ClientArchitecture
//
//  Created by Astha Gupta on 1/22/18.
//  Copyright © 2018 Astha Gupta. All rights reserved.
//

import Foundation
import RealmSwift

public class MTDatabaseObject: Object {
}

protocol MTDatabaseService {
    func getObject<T>(objectType: T.Type, predicate: NSPredicate) -> T? where T: MTDatabaseObject
    func getList<T>(objectType: T.Type, predicate: NSPredicate) -> [T]? where T: MTDatabaseObject
    func getList<T>(objectType: T.Type, byIds ids: [String]) -> [T] where T: MTDatabaseObject
    func getObject<T>(objectType: T.Type, byId id: String) -> T where T: MTDatabaseObject
}

