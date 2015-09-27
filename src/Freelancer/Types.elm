module Freelancer.Types where

import Set exposing (Set)


type UserId    = UserId Int
type ProjectId = ProjectId Int

type alias Currency = Int
type alias Qualification = Int
type alias Badge = Int
type alias Role = Int
type alias UserChosenRole = Int
type alias AccountBalances = Int
type alias MembershipPackage = Int
type alias CoverImageResult = Int
type alias UserStatus = Int
type alias Reputation = Int
type alias Job = Int
type alias Timestamp = Int
type alias Location = Int
type alias UserSpamProfile = Int
type alias ProjectStatus = Int
type alias ProjectSubStatus = Int
type alias ProjectType = Int
type alias Budget = Int
type alias HourlyProjectInfo = Int
type alias PrepaidMilestone = Int
type alias ProjectBidStats = Int
type alias ProjectUpgrades = Int
type alias ProjectAttachment = Int
type alias Bid = Int
type alias FrontendProjectStatus = Int
type alias NDASignature = Int
type alias ReviewAvailability = Int

type alias User =
  { id                  : UserId
  , accountBalances     : AccountBalances -- permission: financial:get
  , avatar              : Maybe String
  , avatarCdn           : Maybe String
  , avatarLarge         : Maybe String
  , badges              : List Badge
  , chosenRole          : UserChosenRole
  , closed              : Maybe Bool -- permission: user:admin
  , coverImage          : CoverImageResult
  , displayName         : Maybe String
  , email               : Maybe String -- permission: user:personal, tracking: off
  , employerReputation  : Reputation
  , forceVerify         : Maybe Bool -- permission: user:admin
  , hourlyRate          : Float
  , isActive            : Maybe Bool -- permission: user:admin
  , jobs                : List Job
  , limitedAccount      : Maybe Bool
  , location            : Location
  , membershipPackage   : MembershipPackage -- permission: user:personal
  , portfolioCount      : Int
  , preferredFreelancer : Maybe Bool
  , primaryCurrency     : Currency
  , primaryLanguage     : Maybe String
  , profileDescription  : String
  , qualifications      : List Qualification
  , registrationDate    : Timestamp
  , reputation          : Reputation
  , role                : Role
  , searchLanguages     : Set String
  , spamProfile         : UserSpamProfile -- permission: user:admin
  , status              : UserStatus
  , suspended           : Maybe Bool -- permission: user:personal
  , tagline             : Maybe String
  , trueLocation        : Location -- permission: user:true_location_view
  , username            : String
  }

type alias Project =
  { id                     : ProjectId
  , activePrepaidMilestone : PrepaidMilestone
  , assisted               : Maybe Bool
  , attachments            : List ProjectAttachment
  , bidperiod              : Int
  , bidStats               : ProjectBidStats
  , budget                 : Budget
  , canPostReview          : ReviewAvailability
  , currency               : Currency
  , deleted                : Bool
  , description            : Maybe String
  , featured               : Bool
  , frontendProjectStatus  : FrontendProjectStatus
  , hidebids               : Bool
  , hireme                 : Bool
  , hiremeInitialBid       : Bid
  , hourlyProjectInfo      : HourlyProjectInfo
  , invitedFreelancers     : List User -- permission: project:get_invited_freelancers
  , jobs                   : List Job
  , language               : String
  , local                  : Bool
  , location               : Location
  , ndaSignatures          : Set NDASignature
  , negotiated             : Bool
  , negotiatedBid          : Bid
  , nonpublic              : Bool
  , ownerId                : Maybe UserId
  , previewDescription     : Maybe String
  , qualifications         : List Qualification
  , recommendedFreelancers : List User -- permission: project:get_recommended_freelancers
  , seoUrl                 : Maybe String
  , status                 : ProjectStatus
  , submitdate             : Timestamp -- deprecated
  , subStatus              : ProjectSubStatus
  , timeFreeBidsExpire     : Timestamp
  , timeSubmitted          : Timestamp
  , timeUpdated            : Timestamp
  , title                  : String
  , trueLocation           : Location -- permission: project:true_location_view
  , type'                  : ProjectType
  , upgrades               : ProjectUpgrades
  , urgent                 : Bool
  }
















