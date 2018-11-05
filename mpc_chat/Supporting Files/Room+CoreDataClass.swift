//
//  Room+CoreDataClass.swift
//  mpc_chat
//
//  Created by Corey Baker on 11/1/18.
//  Copyright © 2018 University of Kentucky - CS 485G. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Room)
public class Room: NSManagedObject {
    
    private func created() -> () {
        
        //If a time was already created, never change it
        if createdAt == nil{
            createdAt = MPCChatUtility.getCurrentTime()
            modifiedAt = createdAt!
        }
    }
    
    //Called everytime data is modified
    fileprivate func modified() -> (){
        modifiedAt = MPCChatUtility.getCurrentTime()
    }
    
    func createNew(_ roomName: String, owner: Peer) -> (){
        self.uuid = UUID.init().uuidString
        self.owner = owner
        
        created()
        updated(roomName)
    }
    
    func updated(_ roomName:String)-> (){
        name = roomName
        modified()
    }
    
}
