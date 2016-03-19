//
//  GKLink.swift
//  Pods
//
//  Created by Jelle Vandebeeck on 15/03/16.
//
//

import Foundation
import AEXML

/**
 A link to an external resource (Web page, digital photo, video clip, etc) with additional information.
*/
public final class GKLink {
    /// URL of hyperlink.
    public var link: String?

    /// Text of hyperlink.
    public var text: String?
    
    /// Mime type of content.
    public var mimeType: String?
}

extension GKLink: GKMappable {
    
    convenience init?(fromElement element: AEXMLElement) {
        // When the element is an error, don't create the instance.
        if element.errored { return nil }
        self.init()
        
        link = element.attributes["href"]
        
        mimeType <~ element["type"]
        text     <~ element["text"]
    }
    
}