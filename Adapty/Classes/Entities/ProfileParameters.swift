//
//  ProfileParameters.swift
//  Adapty
//
//  Created by Aleksei Valiano on 26.09.2022.
//

import Foundation

public struct ProfileParameters {
    public internal(set) var firstName: String?
    public internal(set) var lastName: String?
    public internal(set) var gender: Gender?
    public internal(set) var birthday: String?
    public internal(set) var email: String?
    public internal(set) var phoneNumber: String?
    public internal(set) var facebookUserId: String?
    public internal(set) var facebookAnonymousId: String?
    public internal(set) var amplitudeUserId: String?
    public internal(set) var amplitudeDeviceId: String?
    public internal(set) var mixpanelUserId: String?
    public internal(set) var appmetricaProfileId: String?
    public internal(set) var appmetricaDeviceId: String?
    var storeCountry: String?
    public internal(set) var appTrackingTransparencyStatus: UInt?
    var codableCustomAttributes: Profile.CustomAttributes?
    public internal(set) var analyticsDisabled: Bool?
    public var customAttributes: [String: Any]? { codableCustomAttributes?.convertToSimpleDictionary() }
    
    init() {}
    init(storeCountry: String) {
        self.storeCountry = storeCountry
    }
    init(customAttributes: Profile.CustomAttributes) {
        self.codableCustomAttributes = customAttributes
    }
}

extension ProfileParameters {
    public static let empty : ProfileParameters = ProfileParameters()
    public func builder() -> Builder { Builder(self) }
}
extension ProfileParameters: Equatable, Sendable {}

extension ProfileParameters: Codable {
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case gender
        case birthday
        case email
        case phoneNumber = "phone_number"
        case facebookUserId = "facebook_user_id"
        case facebookAnonymousId = "facebook_anonymous_id"
        case amplitudeUserId = "amplitude_user_id"
        case amplitudeDeviceId = "amplitude_device_i"
        case mixpanelUserId = "mixpanel_user_id"
        case appmetricaProfileId = "appmetrica_profile_id"
        case appmetricaDeviceId = "appmetrica_device_id"
        case storeCountry = "store_country"
        case appTrackingTransparencyStatus = "att_status"
        case codableCustomAttributes = "custom_attributes"
        case analyticsDisabled = "analytics_disabled"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(firstName, forKey: .firstName)
        try container.encodeIfPresent(lastName, forKey: .lastName)
        try container.encodeIfPresent(gender, forKey: .gender)
        try container.encodeIfPresent(birthday, forKey: .birthday)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(phoneNumber, forKey: .phoneNumber)
        try container.encodeIfPresent(facebookUserId, forKey: .facebookUserId)
        try container.encodeIfPresent(facebookAnonymousId, forKey: .facebookAnonymousId)
        try container.encodeIfPresent(amplitudeUserId, forKey: .amplitudeUserId)
        try container.encodeIfPresent(amplitudeDeviceId, forKey: .amplitudeDeviceId)
        try container.encodeIfPresent(mixpanelUserId, forKey: .mixpanelUserId)
        try container.encodeIfPresent(appmetricaProfileId, forKey: .appmetricaProfileId)
        try container.encodeIfPresent(appmetricaDeviceId, forKey: .appmetricaDeviceId)
        try container.encodeIfPresent(storeCountry, forKey: .storeCountry)
        try container.encodeIfPresent(appTrackingTransparencyStatus, forKey: .appTrackingTransparencyStatus)
        try container.encodeIfPresent(codableCustomAttributes, forKey: .codableCustomAttributes)
        try container.encodeIfPresent(analyticsDisabled, forKey: .analyticsDisabled)
    }
}