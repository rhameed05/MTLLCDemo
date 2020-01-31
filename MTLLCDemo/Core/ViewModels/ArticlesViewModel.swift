//
//  ArticlesViewModel.swift
//  MTLLCDemo
//
//  Created by Mac on 29/01/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

    import Foundation

    public class ArticlesViewModel {
        
        public var status : String?
        public var copyright : String?
        public var num_results : Int?
        public var results : Array<Results>?
        
        public class func parse(array:NSArray) -> [ArticlesViewModel]
        {
            var models:[ArticlesViewModel] = []
            for item in array
            {
                models.append(ArticlesViewModel(dictionary: item as! NSDictionary)!)
            }
            return models
        }
        
        required public init?(dictionary: NSDictionary) {
            
            self.status = dictionary["status"] as? String
            self.copyright = dictionary["copyright"] as? String
            self.num_results = dictionary["num_results"] as? Int
            if (dictionary["results"] != nil) { self.results = Results.parse(array: dictionary["results"] as! NSArray) }
        }
        public func dictionaryRepresentation() -> NSDictionary {
            
            let dictionary = NSMutableDictionary()
            
            dictionary.setValue(self.status, forKey: "status")
            dictionary.setValue(self.copyright, forKey: "copyright")
            dictionary.setValue(self.num_results, forKey: "num_results")
            
            return dictionary
        }
    }
      public class MediaData {
        public var url : String?
        public var format : String?
        public var height : Int?
        public var width : Int?
        public class func parse(array:NSArray) -> [MediaData]
        {
            var models:[MediaData] = []
            for item in array
            {
                models.append(MediaData(dictionary: item as! NSDictionary)!)
            }
            return models
        }
        required public init?(dictionary: NSDictionary) {
            
            self.url = dictionary["url"] as? String
            self.format = dictionary["format"] as? String
            self.height = dictionary["height"] as? Int
            self.width = dictionary["width"] as? Int
        }
        public func dictionaryRepresentation() -> NSDictionary {
            
            let dictionary = NSMutableDictionary()
            
            dictionary.setValue(self.url, forKey: "url")
            dictionary.setValue(self.format, forKey: "format")
            dictionary.setValue(self.height, forKey: "height")
            dictionary.setValue(self.width, forKey: "width")
            
            return dictionary
        }
        
    }

    public class Media {
        public var type : String?
        public var subtype : String?
        public var caption : String?
        public var copyright : String?
        public var approved_for_syndication : Int?
        public var mediadata : Array<MediaData>?
        
        public class func parse(array:NSArray) -> [Media]
        {
            var models:[Media] = []
            for item in array
            {
                models.append(Media(dictionary: item as! NSDictionary)!)
            }
            return models
        }
        
        required public init?(dictionary: NSDictionary) {
            
            self.type = dictionary["type"] as? String
            self.subtype = dictionary["subtype"] as? String
            self.caption = dictionary["caption"] as? String
            self.copyright = dictionary["copyright"] as? String
            self.approved_for_syndication = dictionary["approved_for_syndication"] as? Int
            if (dictionary["media-metadata"] != nil) { self.mediadata = MediaData.parse(array: dictionary["media-metadata"] as! NSArray) }
        }
        
        public func dictionaryRepresentation() -> NSDictionary {
            
            let dictionary = NSMutableDictionary()
            
            dictionary.setValue(self.type, forKey: "type")
            dictionary.setValue(self.subtype, forKey: "subtype")
            dictionary.setValue(self.caption, forKey: "caption")
            dictionary.setValue(self.copyright, forKey: "copyright")
            dictionary.setValue(self.approved_for_syndication, forKey: "approved_for_syndication")
            
            return dictionary
        }
        
    }
    public class Results {
        public var url : String?
        public var adx_keywords : String?
        public var column : String?
        public var section : String?
        public var byline : String?
        public var type : String?
        public var title : String?
        public var abstract : String?
        public var published_date : String?
        public var source : String?
        public var id : Int?
        public var asset_id : Int?
        public var views : Int?
        public var des_facet : Array<String>?
        public var org_facet : Array<String>?
        public var per_facet : Array<String>?
        public var geo_facet : String?
        public var media : Array<Media>?
        
        public class func parse(array:NSArray) -> [Results]
        {
            var models:[Results] = []
            for item in array
            {
                models.append(Results(dictionary: item as! NSDictionary)!)
            }
            return models
        }
        
        required public init?(dictionary: NSDictionary) {
            
            self.url = dictionary["url"] as? String
            self.adx_keywords = dictionary["adx_keywords"] as? String
            self.column = dictionary["column"] as? String
            self.section = dictionary["section"] as? String
            self.byline = dictionary["byline"] as? String
            self.type = dictionary["type"] as? String
            self.title = dictionary["title"] as? String
            self.abstract = dictionary["abstract"] as? String
            self.published_date = dictionary["published_date"] as? String
            self.source = dictionary["source"] as? String
            self.id = dictionary["id"] as? Int
            self.asset_id = dictionary["asset_id"] as? Int
            self.views = dictionary["views"] as? Int
            self.geo_facet = dictionary["geo_facet"] as? String
            if (dictionary["media"] != nil) { self.media = Media.parse(array: dictionary["media"] as! NSArray) }
        }
        
        
        public func dictionaryRepresentation() -> NSDictionary {
            
            let dictionary = NSMutableDictionary()
            
            dictionary.setValue(self.url, forKey: "url")
            dictionary.setValue(self.adx_keywords, forKey: "adx_keywords")
            dictionary.setValue(self.column, forKey: "column")
            dictionary.setValue(self.section, forKey: "section")
            dictionary.setValue(self.byline, forKey: "byline")
            dictionary.setValue(self.type, forKey: "type")
            dictionary.setValue(self.title, forKey: "title")
            dictionary.setValue(self.abstract, forKey: "abstract")
            dictionary.setValue(self.published_date, forKey: "published_date")
            dictionary.setValue(self.source, forKey: "source")
            dictionary.setValue(self.id, forKey: "id")
            dictionary.setValue(self.asset_id, forKey: "asset_id")
            dictionary.setValue(self.views, forKey: "views")
            dictionary.setValue(self.geo_facet, forKey: "geo_facet")
            
            return dictionary
        }
        
    }
