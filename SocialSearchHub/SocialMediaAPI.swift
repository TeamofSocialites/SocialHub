//
//  SocialMediaAPI.swift
//  SocialSearchHub
//
//  Created by Eva Keeling on 3/29/22.
//
// OWNER: Jabryl

import Foundation
import Alamofire
import Parse

// Alamofire will decode the response into this struct.
struct InstagramHashTagResponse: Codable {
    struct Data : Codable {
        let id : String
    }
    
    let data : [Data]
}

// Alamofire will decode the response into this struct.
// See https://www.youtube.com/watch?v=1QuH2CGmi6I for more details.
struct InstagramTopPostResponse: Codable {
    struct Post : Codable {
        let id : String
        let media_type : String
        let caption : String
        let permalink : String
        let comments_count : Int?
        let like_count : Int?
        let media_url : String?
    }
    
    let data : [Post]
}

struct InstagramCredentials {
    let instagramAPIDomain = "https://graph.facebook.com/v13.0/"
    let instagramUserID = "17841452763115082" // Connected IG User ID of professional account
    let instagramAppID = "566203391320512" // App ID
    let instagramAccessToken = "ACCESS_TOKEN" // Long-term Access Token that expires June 17, 2022. TODO: Will need to be replaced.
}

class SocialMediaAPI {
    let instaCreds = InstagramCredentials()
    
    // MAIN FUNCTION to call.
    // GIVEN: Query String
    // RETURNS: Posts
    func searchInstagram(query: String) async -> [InstagramTopPostResponse.Post] {
        do {
            // Get hashtag ID
            let hashtagIDResponse = try await asyncGetInstagramSearchTermHashtagID(query: query)
            let hashtagID = hashtagIDResponse.data[0].id
            
            // Get top posts
            let topPostsResponse = try await asyncGetHashtagTopPosts(hashtagID: hashtagID)
            
            return topPostsResponse.data
        } catch {
            print("Error occured getting Instagram Search Results")
        }
        
        return [InstagramTopPostResponse.Post]()
    }
    
    // HELPER FUNCTION
    // Finds the hashtag ID to be used to find the most popular posts
    // See https://developers.facebook.com/docs/instagram-api/reference/ig-hashtag-search for more details
    func asyncGetInstagramSearchTermHashtagID(query: String) async throws -> InstagramHashTagResponse {
        // Form request.
        let requestURL = instaCreds.instagramAPIDomain + "ig_hashtag_search"
        
        // Parameters
        let parameters = ["user_id": instaCreds.instagramUserID, "q": query, "access_token": instaCreds.instagramAccessToken]
        
        // Send request
        let request = AF.request(requestURL, parameters: parameters)
        
        return try await request.serializingDecodable(InstagramHashTagResponse.self).value
       
    }
    
    // HELPER FUNCTION
    // Given hashtagID returns all the top posts!
    // See https://developers.facebook.com/docs/instagram-api/reference/ig-hashtag/top-media for more details
    func asyncGetHashtagTopPosts(hashtagID: String) async throws -> InstagramTopPostResponse {
        if (hashtagID.isEmpty) {
            print("Error. hashtagID cannot be null")
        }
        
        // Form requests
        let requestURL = instaCreds.instagramAPIDomain + hashtagID + "/top_media"
        print(requestURL)
        
        // Parameters
        let parameters = ["user_id": instaCreds.instagramUserID, "fields": "id,media_type,media_url,comments_count,like_count,permalink,caption", "access_token": instaCreds.instagramAccessToken]
        
        // Send request
        let request = AF.request(requestURL, parameters: parameters)
        
        return try await request.serializingDecodable(InstagramTopPostResponse.self).value
    }
}
