//
//  main.swift
//  BluetoothLinux
//
//  Created by Alsey Coleman Miller on 12/6/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth
import BluetoothLinux

func Error(_ text: String) -> Never {
    print(text)
    exit(1)
}

// get Bluetooth device

guard let adapter = try? Adapter()
    else { Error("No Bluetooth adapters found") }

print("Found Bluetooth adapter with device ID: \(adapter.identifier)")

print("Address: \(adapter.address!)")

guard CommandLine.arguments.count == 2
    else { Error("No Address specified") }

let peerAddressString = CommandLine.arguments[1]

guard let peerAddress = Address(rawValue: peerAddressString)
    else { Error("Invalid Address specified") }


/// Perform Test
GATTClientTest(adapter: adapter, address: peerAddress)
