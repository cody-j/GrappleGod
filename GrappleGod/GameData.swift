//
//  GameData.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-26.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import Foundation
import RealmSwift

class Settings: Object {
    @objc dynamic var haptics = true
}

class GameData {
    
    // Singleton
    static var sharedInstance = GameData()
    
    var realm: Realm!
    
    private func getRealm() -> Realm {
        
        do {
            if self.realm == nil {
                self.realm = try Realm()
            }

            return self.realm
        } catch {
            fatalError("Could not get persistent store")
        }
        
    }
    
    private func initSettings() -> Settings {
        let realm = getRealm()
        
        let settings = Settings()
        
        try! realm.write {
            realm.add(settings)
        }
        
        return settings
    }
    
    func getSettings() -> Settings {
        let realm = getRealm()
        
        if let settings = realm.objects(Settings.self).first {
            return settings
        } else {
            return initSettings()
        }
    }
    
}
