module Freelancer.Types where

import Set exposing (Set)
import Dict exposing (Dict)

--USER

type alias UserExceptionCodes = Int

type alias TokenKind = Int

type alias UserChosenRole = Int

type alias ShowcaseItemStatus = Int

type alias UserCompletedWorkContext = Int

type alias ShowcaseStatus = Int

type alias ShowcaseSourceType = Int

type alias ReputationPeriod = Int

type alias PhoneVerificationRequestType = Int

type alias AccountBalances =
  { balances                 : List Balance
  , bidsRemaining            : Int
  , jobsRemaining            : Int
  , jobChangesRemaining      : Int
  , servicePostingsRemaining : Int
  }

type alias Badge =
  { id          : BadgeId
  , name        : String
  , description : String
  , timeAwarded : Timestamp
  , iconUrl     : String
  }

type alias Balance =
  { amount   : Float
  , currency : Currency
  }
  
type alias CoverImage =
  { id          : CoverImageId
  , url         : String
  , description : String
  , width       : Int
  , height      : Int
  }

type alias CoverImageResult =
  { currentImage : CoverImage
  , pastImages   : List CoverImage
  }

type alias CropBox =
  { xLeft   : Int
  , yTop    : Int
  , xRight  : Int
  , yBottom : Int
  }

type alias FacebookCredentials =
  { facebookUserId           : FacebookId
  , facebookTokenForBusiness : String
  , facebookAccessToken      : String
  , freelancerUserId         : UserId
  , facebookAppId            : FacebookAppId
  }

type alias FacebookIdPair =
  { facebookUserId : FacebookId
  , facebookAppId  : String
  }

type alias Feedback =
  { userId     : UserId
  , source     : String
  , body       : String
  , timeAdded  : Timestamp
  , section    : String
  , additional : String
  , ip         : String
  , userAgent  : String
  }

type alias MembershipPackage =
  { id                  : MembershipPackageId
  , name                : String
  , bidLimit            : Int
  , bidRefreshRate      : Float
  , timeBidRefresh      : Timestamp
  , jobLimit            : Int
  , jobChangeLimit      : Int
  , servicePostingLimit : Int
  }

type alias NewCoverImage =
  { fileId      : FileId --FileserviceCommon???
  , filename    : String
  , cropBox     : CropBox
  , description : String
  , width       : Int
  , height      : Int
  , mimetype    : String
  }

type alias PhoneVerificationDetails =
  { referenceId        : String
  , verificationCode   : String
  , requestPhoneChange : Bool
  , phoneDetails       : PhoneVerificationRequest
}

type alias PhoneVerificationRequest =
  { phoneNumber        : String
  , countryCode        : String
  , operation          : PhoneVerificationRequestType
  , requestedCountry   : String
  , requestPhoneChange : Bool
  }

type alias PhoneVerifyRequestResult =
  { referenceId : String
  }

type alias PhoneVerifySubmitResult =
  { idVerificationRequired : Bool
  }

type alias Reputation =
  { --Strange annotation at top is permission: reputation:inspect, follow up?
    entireHistory : ReputationData
  , last3Months   : ReputationData
  , last12Months  : ReputationData
  , userId        : UserId
  , role          : Role
  , earningsScore : Float
  , jobHistory    : JobHistory
  , projectStats  : Dict FrontendProjectStatus Int
  }

type alias ReputationData =
  { overall           : Float
  , onBudget          : Float
  , onTime            : Float
  , positive          : Float
  , categoryRatings   : Dict String Float
  , all               : Int
  , reviews           : Int
  , incompleteReviews : Int
  , complete          : Int
  , incomplete        : Int
  , earnings          : Float --Strange annotation in field permission: user:financial
  , completionRate    : Float
  , rehireRate        : Float
  }

type alias Showcase =
  { id            : ShowcaseId
  , title         : String
  , userId        : UserId
  , source        : ShowcaseSource
  , budget        : Float
  , currency      : Currency
  , timeSubmitted : Timestamp
  , status        : ShowcaseStatus
  , showcaseItems : Set ShowcaseItems
  , rating        : Rating
  }

type alias ShowcaseFile =
  { filename          : String
  , fileserviceFileId : FileserviceId
  , thumbnails        : Dict String ShowcaseFileThumbnail
  , cdnUrl            : String
  }

type alias ShowcaseFilethumbnail =
  { filename          : String
  , fileserviceFileId : FileserviceId
  , width             : Int
  , height            : Int
  , cdnUrl            : String
  }

type alias ShowcaseGetResult =
  { showcases : List Showcase
  , users     : Dict UserId User
  }

type alias ShowcaseItem =
  { id                   : ShowcaseItemId
  , showcaseId           : ShowcaseId
  , title                : String
  , description          : String
  , category             : GlobalTag
  , subcategory          : GlobalTag
  , tags                 : Set GlobalTag
  , url                  : String
  , status               : ShowcaseItemStatus
  , timeSubmitted        : Timestamp
  , qualityScore         : Int
  , seoUrl               : String
  , jobs                 : Set Job
  , itemFile             : ShowcaseFile
  , subcategoryAnswers   : Set ShowcaseSubcategoryAnswer
  , parentShowcaseItemId : ShowcaseItemId
  }

type alias ShowcaseItemGetResult =
  { showcaseItems : List ShowcaseItem
  , users         : Dict UserId User
  }

type alias ShowcaseItemRejectReason =
  { showcaseItemId : ShowcaseItemId
  , optionId       : ShowcaseRejectOptionId
  , reason         : String
  , userId         : UserId
  }

type alias ShowcaseSource =
  { sourceId       : ShowcaseSourceId
  , sourceType     : ShowcaseSourceType
  , parentSourceId : ShowcaseSourceParentId
  }

type alias ShowcaseSubcategoryAnswer =
  { id             : ShowcaseSubcategoryAnswerId
  , question       : ShowcaseSubcategoryQuestion
  , showcaseItemId : ShowcaseItemId
  , answer         : String
  }

type alias ShowcaseSubcategoryQuestion =
  { id       : ShowcaseSubcategoryQuestionId
  , tag      : GlobalTag
  , question : String
  }

type alias ShowcaseSubcategoryQuestionFilter =
  { questionIds : Set ShowcaseSubcategoryQuestionId
  , tagIds      : Set GlobalTagId
  }

type alias Token =
  { kind     : TokenKind
  , data     : String
  , deviceId : String
  , userId   : UserId
  }

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

type alias UserCompletedWork =
  { context        : UserCompletedWorkContext
  , sourceParentId : UserCompletedWorkId
  , title          : String
  , description    : String
  , budget         : Float
  , currency       : Currency
  , jobs           : Set Job
  , sourceId       : ShowcaseSourceId
  }

type alias UserCreateResult =
  { user     : User
  , authHash : String
  }

type alias UserException =
  { code     : UserExceptionCodes
  , message  : String
  , httpCode : Int
  }

type alias UserSpamProfile =
  { accountBalance      : Float
  , paymentVerification : Bool
  , emailVerification   : Bool
  , ratecount           : Int
  , regdate             : Timestamp
  , closed              : Bool
  }

type alias UserStatus =
  { paymentVerified : Bool
  , emailVerified   : Bool
  , depositMade     : Bool
  , profileComplete : Bool
  , phoneVerified   : Bool
  }

type alias UsersSearchResult =
  { users      : List User
  , totalCount : Int
  }

--PROJECTS

type alias ProjectExceptionCodes = Int

type alias ProjectStatus = Int

type alias ProjectSubStatus = Int

type alias BidAwardStatus = Int

type alias BidPaidStatus = Int

type alias BidCompleteStatus = Int

type alias ReviewStatus = Int

type alias ReviewProjectStatus = Int

type alias ReviewType = Int

type alias ProjectType = Int

type alias ProjectDuration = Int

type alias ProjectTemplateQuestionTextStyle = Int

type alias ProjectLocalizability = Int

type alias PrepaidMilestoneStatus = Int

type alias MilestoneStatus = Int

type alias MilestoneRequestStatus = Int

type alias MilestoneReason = Int

type alias RequestedPrepaidMilestones = Int

type alias ProjectUpgradeOptions = Int

type alias HireMeOfferStatus = Int

type alias NegotiatedOfferStatus = Int

type alias Bid =
  { --annotation permission: bid:inspect
    id                       : BidId
  , bidderId                 : UserId
  , projectId                : ProjectId
  , retracted                : Bool
  , amount                   : Float
  , period                   : Int
  , description              : String --annotation permission: bid:description_view
  , projectOwnerId           : UserId
  , submitdate               : Timestamp --annotation deprecated:
  , buyerProjectFee          : Fee
  , timeSubmitted            : Timestamp
  , highlighted              : Bool
  , sponsored                : Float
  , milestonePercentage      : Int
  , awardStatusPossibilities : Set BidAwardStatus
  , awardStatus              : BidAwardStatus
  , paidStatus               : BidPaidStatus
  , completeStatus           : BidCompleteStatus
  , reputation               : Reputation --original format users.Reputation
  , timeAwarded              : Timestamp
  , frontendBidStatus        : FrontendBidStatus
  , hiremeCounterOffer       : HireMeCounterOffer
  , shortlisted              : Bool --annotation permission: shortlisted_bid:view
  , score                    : Float
  , distance                 : Float
  , negotiatedOffer          : NegotiatedOffer
  }

type alias BidInfo =
  { --annotation permission: project:list
    projectId               : ProjectId
  , minimumFee              : Float
  , rate                    : Float
  , highlightCost           : Float
  , highlightCurrency       : Currency
  , highestSponsorAmount    : Float
  , minimumSponsorIncrement : Float
  , maximumHighlightCount   : Int
  , currentHighlightCount   : Int
  , defaultBid              : Bid
  , minimumBid              : Float
  , maximumBid              : Float
  , range                   : Int
  }

type alias BidRecommendResult =
  { recommendedBid : Bid
  }

type alias BidsGetResult =
  { bids     : List Bid
  , users    : Dict UserId User --original format users.User
  , projects : Dict ProjectId Project
  }

type alias Budget =
  { minimum     : Float
  , maximum     : Float
  , name        : String
  , projectType : ProjectType
  , currencyId  : CurrencyId
  }

type alias CategoriesGetResult =
  { categories : List Category
  , jobs       : Dict CategoryId List Job
  }

type alias Commitment =
  { hours    : Int
  , interval : TimeUnit
  }

type alias ContestUpgrades =
  { featured   : Bool
  , sealed     : Bool
  , nonpublic  : Bool
  , highlight  : Bool
  , guaranteed : Bool
  }

type alias CurrenciesGetResult =
  { currencies : List Currency
  }

type alias Highlight =
  { preTag  : String
  , postTag : String
  }

type alias HireMeCounterOffer =
  { bidId         : BidId
  , description   : String
  , status        : HireMeOfferStatus
  , amount        : Float
  , period        : Int
  , timeSubmitted : Timestamp
  , timeUpdated   : Timestamp
  }

type alias HourlyProjectInfo =
  { commitment   : Commitment
  , durationEnum : ProjectDuration
  }

type alias JobBundle =
  { id                  : JobBundleId
  , jobBundleCategoryId : JobBundleCategoryId
  , name                : String
  , jobs                : Set JobId
  }

type alias JobBundleCategoriesGetResult =
  { jobBundleCategories : List JobBundleCategory
  }

type alias JobBundleCategory =
  { id         : JobBundleCategoryId
  , name       : String
  , jobBundles : List JobBundle
  }

type alias JobBundlesGetResult =
  { jobBundles : List JobBundle
  }

type alias Milestone =
  { --annotation permission: milestone:view
    transactionId  : TransactionId
  , projectOwnerId : UserId
  , bidderId       : UserId
  , amount         : Float
  , reason         : MilestoneReason
  , otherReason    : String
  , projectId      : ProjectId
  , bidId          : BidId
  , currency       : Currency
  , isFromPrepaid  : Bool
  , status         : MilestoneStatus
  , disputeId      : DisputeId
  , timeCreated    : Timestamp
  }

type alias MilestoneReleaseResult =
  { remainingMilestone : Milestone
  }

type alias MilestoneRequest =
  { --annotation permission: milestone_request:view
    id             : MilestoneRequestId
  , bidderId       : UserId
  , bidId          : BidId
  , timeRequested  : Timestamp
  , amount         : Float
  , projectOwnerId : UserId
  , projectId      : ProjectId
  , description    : String
  , currency       : Currency
  , status         : MilestoneRequestStatus
  }

type alias MilestoneRequestsGetResult =
  { milestoneRequests : Dict MilestoneRequestId MilestoneRequest
  , users             : Dict UserId User --annotation original format users.User
  }

type alias MilestonesGetResult =
  { milestones : Dict TransactionId Milestone
  , users      : Dict UserId User
  }

type alias NdaSignature =
  { projectId  : ProjectId
  , userId     : UserId
  , timeSigned : Timestamp
  }

type alias NegotiatedOffer =
  { projectId           : ProjectId
  , freelancerId        : UserId
  , status              : NegotiatedOfferStatus
  , requestedMilestones : RequestedPrepaidMilestones
  , timeUpdated         : Timestamp
  }

type alias OverallRatingDetails =
  { categoryRatings : Dict String Rating
  , paidAmount      : Float --annotation deprecated:
  , onTimeDisplay   : String
  , onBudgetDisplay : String
  }

type alias PrepaidMilestone =
  { amount   : Float
  , status   : PrepaidMilestoneStatus
  , toUserId : UserId
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
  , ndaSignatures          : Set NdaSignature
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

type alias ProjectAttachment =
  { id            : ProjectAttachmentId
  , filename      : String
  , timeSubmitted : Timestamp
  , url           : String
  , accessHash    : String
  , contentType   : String
  }

type alias ProjectBidStats =
  { bidCount : Int
  , bidAvg   : Float
  }

type alias ProjectBidsGetResult =
  { bids            : List Bid
  , users           : Dict UserId User --original format users.User
  , recommendedBid  : Bid --annotation permission: recommended_bid:inspect
  , shortlistedBids : List Bid --annotation permission: shortlisted_bid:view
  }

type alias ProjectException =
  { code     : ProjectExceptionCodes
  , message  : String
  , httpCode : Int
  }

type alias ProjectNda =
  { projectId : ProjectId
  , userId    : UserId
  , fullname  : String
  , address   : String
  , city      : String
  , state     : String
  , country   : String
  , phone     : String
  }

type alias ProjectTemplate =
  { id                       : ProjectTemplateId
  , description              : String
  , active                   : Bool
  , checkerboardCategoryName : String
  , projectTitle             : String
  , orderNum                 : Int
  , localizable              : ProjectLocalizability
  }

type alias ProjectTemplateAnswer =
  { id              : ProjectTemplateAnswerId
  , questionId      : ProjectTemplateQuestionId
  , answer          : String
  , deletesQuestion : Bool
  , orderNum        : Int
  , answerRange     : DoubleRange --"double" in this context unique - wat do.
  , jobs            : List Job
  }

type alias ProjectTemplateQuestion =
  { id                          : ProjectTemplateQuestionId
  , templateId                  : ProjectTemplateId
  , projectTemplateQuestionText : ProjectTemplateQuestionText
  , previousQuestionId          : ProjectTemplateQuestionId
  , antecedentAnswerId          : ProjectTemplateAnswerId
  , active                      : Bool
  }

type alias ProjectTemplateQuestionText =
  { id             : ProjectTemplateQuestionTextId
  , questionText   : String
  , helpText       : String
  , answerTemplate : String
  , style          : ProjectTemplateQuestionTextStyle
  }

type alias ProjectTemplatesGetResult =
  { templates : Dict ProjectTemplateId ProjectTemplate
  , questions : Dict ProjectTemplateQuestionId ProjectTemplateQuestion
  , answers   : Dict ProjectTemplateAnswerId ProjectTemplateAnswer
  }

type alias ProjectUpgradeFees =
  { currency                    : Currency
  , featuredPrice               : Float
  , extendPrice                 : Float
  , nonpublicPrice              : Float
  , sealedPrice                 : Float
  , assistedPrice               : Float
  , fulltimePrice               : Float
  , fulltimeCommissionThreshold : Float
  , freeFeaturedCouponId        : FeaturedCouponId
  , freeSealed                  : Bool
  , freeExtend                  : Bool
  , ndaPrice                    : Float
  , urgentPrice                 : Float
  , isTaxIncluded               : Bool
  , freeNda                     : Bool
  , deletePrice                 : Float
  , freeAssisted                : Bool
  }

type alias ProjectUpgradeFeesGetResult =
  { projectUpgradeFees : List ProjectUpgradeFees
  }

type alias ProjectUpgrades =
  { featured               : Bool
  , sealed                 : Bool
  , nonpublic              : Bool
  , fulltime               : Bool
  , urgent                 : Bool
  , qualified              : Bool
  , nda                    : Bool
  , assisted               : Bool
  , activePrepaidMilestone : PrepaidMilestone
  }

type alias ProjectsGetResult =
  { projects     : List Project
  , users        : Dict UserId User --original format users.User
  , selectedBids : Dict ProjectId (List Bid)
  , totalCount   : Int
  }

type Rating = Rating
  { projectId       : ProjectId
  , toUserId        : UserId
  , fromUserId      : UserId
  , projectType     : ProjectType
  , submitdate      : Timestamp --annotation deprecated:
  , timeSubmitted   : Timestamp
  , categoryRatings : Dict String Rating
  , description     : String --annotation permission: rating:privateinfo
  , paidAmount      : Float
  , onBudget        : Bool
  , onTime          : Bool
  , role            : Role
  }

type alias RecommendedProjectsGetResult =
  { projects : List Project
  }

type alias Review =
  { projectId           : ProjectId --annotation deprecated:
  , toUserId            : UserId
  , fromUserId          : UserId
  , role                : Role
  , status              : ReviewStatus
  , timeSubmitted       : Timestamp
  , description         : String
  , submitdate          : Timestamp --annotation deprecated:
  , rating              : Rating
  , reviewProjectStatus : ReviewProjectStatus
  , ratingDetails       : OverallRatingDetails
  , ratings             : List Rating
  , reviewContext       : ReviewContext
  , currency            : Currency
  , bidAmount           : Float --annotation permission: review:view_sealed
  , sealed              : Bool
  , paidAmount          : Float --annotation permission: review:view_sealed
  }

type alias ReviewContext =
  { reviewType  : ReviewType
  , contextId   : ContextId
  , contextName : String
  , seoUrl      : String
  }

type alias ReviewData =
  { projectId              : ProjectId
  , toUserId               : UserId
  , fromUserId             : UserId
  , role                   : Role
  , reputationData         : ReputationData --original format users.ReputationData
  , comment                : String
  , internalPrivateMessage : String
  , tip                    : String
  , invoiceId              : InvoiceId
  , rehire                 : Bool
  , hourlyRate             : Float
  , reviewType             : ReviewType
  , projectType            : ProjectType
  }

type alias ReviewsGetResult =
  { reviews  : List Review
  , users    : Dict UserId User --original format users.User
  , projects : Dict ProjectId Project
  , contests : Dict ContestId Contest --original format contests.Contest
  }

  --COMMON

type alias ContextType = Int

type alias CheckFields = Int

type alias Role = Int

type alias TimeUnit = Int

type alias SourceType = Int

type alias ExternalAccountType = Int

type alias FrontendProjectStatus = Int

type alias FrontendBidStatus = Int

type alias Captcha =
  { challenge : String
  , response  : String
  }

type alias Category =
  { id   : CategoryId
  , name : String
  }

type alias Context =
  { type' : ContextType
  , id    : ContextId
  }

type alias Country =
  { name              : String
  , flagUrl           : String
  , code              : String
  , highresFlagUrl    : String
  , flagUrlCdn        : String
  , highresFlagUrlCdn : String
  }

type alias Currency =
  { id           : CurrencyId
  , code         : String
  , sign         : String
  , name         : String
  , exchangeRate : Float
  , country      : String
  }

type alias ExternalAccount =
  { type'      : ExternalAccountType
  , identifier : String
  }

type alias Fee =
  { amount   : Float
  , isTaxed  : Bool
  , currency : Currency
  , rate     : Float
  }

type alias GlobalTag =
  { id         : GlobalTagId
  , name       : String
  , seoName    : String
  , isCategory : Bool
  }

type alias Job =
  { id                 : JobId
  , name               : String
  , category           : Category
  , activeProjectCount : Int
  , seoUrl             : String
  , seoInfo            : JobSeoInfo
  }

type alias JobCount =
  { count : Int
  , job   : Job
  }

type alias JobHistory =
  { countOther : Int
  , jobCounts  : List JobCount
  }

type alias JobSeoInfo =
  { seoText             : String
  , seoTextAlt          : String
  , seoWorker           : String
  , seoWorkerAlt        : String
  , seoWorkerPlural     : String
  , seoWorkerPluralAlt  : String
  , phraseWorker        : String
  , contextPhraseWorker : String
  , pluralPhraseWorker  : String
  , countryPerson       : String
  , countryDemonym      : String
  }

type alias Location =
  { country            : Country
  , city               : String
  , latitude           : Float
  , longitude          : Float
  , vicinity           : String
  , administrativeArea : String
  , fullAddress        : String
  }

type alias Qualification =
  { id              : QualificationId
  , name            : String
  , level           : Int
  , type'           : String
  , iconUrl         : String
  , description     : String
  , iconName        : String
  , scorePercentage : Float
  , userPercentile  : Float
  }

--TRANSLATIONS

type alias TranslationStatus = Int

type alias TrackingSource = Int

type alias TrackingAction = Int

type alias TranslationReportType = Int

type alias TranslationExceptionCodes = Int

type alias DomainsContainer =
  { domains : Set String
  }

type alias LanguagesGetResult =
  { languages : Set String
  }

type alias TranslateStatus =
  { status : TranslationStatus
  , reason : String
  }

type alias Translation =
  { id                      : TranslationId
  , translationDomainTextId : TranslationDomainTextId
  , languageCode            : String
  , translation             : String
  , userId                  : UserId
  , active                  : Bool
  , tracking                : TranslationTracking
  }

type alias TranslationContainer =
  { translations : Dict String String
  }

type alias TranslationException =
  { code     : TranslationExceptionCodes
  , message  : String
  , httpCode : Int
  }

type alias TranslationPot =
  { potFile : String
  , domain  : String
  }

type alias TranslationRecord =
  { msgid  : String
  , msgstr : String
  }

type alias TranslationReport =
  { id                      : TranslationReportId
  , translationTextId       : TranslationId
  , userId                  : UserId
  , type'                   : TranslationReportType
  , reportReason            : TranslationReportReason
  , reasonText              : String
  , reporterUserId          : UserId
  , timeReported            : Timestamp
  , timeResolved            : Timestamp
  , resolvedByUserId        : UserId
  , state                   : ReportState
  , translationDomainTextId : TranslationDomainTextId
  , timeUpdated             : Timestamp
  , adminId                 : AdminId
  }

type alias TranslationReportReason =
  { id     : TranslationReportReasonId
  , reason : String
  , type'  : TranslationReportType
  }

type alias TranslationTracking =
  { translationTextId : TranslationId
  , source            : TrackingSource
  , action            : TrackingAction
  }

type alias Translator =
  { id             : TranslatorId
  , userId         : UserId
  , languageCode   : String
  , canApprove     : Bool
  , canSelfApprove : Bool
  , isInternal     : Bool
  }

type alias TranslatorSignup =
  { id               : TranslatorSignupId
  , translatorId     : TranslatorId
  , userId           : UserId
  , languageCode     : String
  , timeCreated      : Timestamp
  , timeRejected     : Timestamp
  , reason           : String
  , state            : TranslatorSignupState
  , adminId          : UserId
  , proficiencyLevel : Int
  }

  --PREFERRED FREELANCERS

type alias FreelancerStatus = Int

type alias FreelancerType = Int

type alias FreelancerPriceCategory = Int

type alias PreferredFreelancer =
  { id                     : PreferredFreelancerId
  , userId                 : UserId
  , languages              : Set String
  , type'                  : FreelancerType
  , profession             : String
  , priceCategory          : FreelancerPriceCategory
  , jobs                   : Set JobId
  , previousProjects       : Set ProjectId
  , previousAssistedAgents : Set UserId
  , conductNotes           : String
  , skypeDetails           : String
  , generalNotes           : String
  , status                 : FreelancerStatus
  }

type alias PreferredFreelancersGetResult =
  { preferredFreelancers : List PreferredFreelancer
  , users                : Dict UserId User --original format users.User
  , jobs                 : Dict JobId Job --original format common.Job
  }

  --PREFERRED FREELANCER PROGRAM

--type alias Status = Int
--
--type alias EntityType = Int
--
--type alias PreferredFreelancer =
--  { id     : PreferredFreelancerId
--  , userId : UserId
--  , status : Status
--  , active : Bool
--  }
--
--type alias PreferredFreelancersGetResult =
--  { preferredFreelancers : List PreferredFreelancer
--  }

-- total 53 undocumented types, 45 id types, 8 others
type UserId                        = UserId                        Int
type ProjectId                     = ProjectId                     Int
type TranslatorId                  = TranslatorId                  Int
type TranslationReportReasonId     = TranslationReportReasonId     Int
type TranslationId                 = TranslationId                 Int
type TranslationDomainTextId       = TranslationDomainTextId       Int
type TranslationReportId           = TranslationReportId           Int
type AdminId                       = AdminId                       Int
type TranslatorSignupId            = TranslatorSignupId            Int
type ShowcaseSubcategoryQuestionId = ShowcaseSubcategoryQuestionId Int
type ShowcaseSubcategoryAnswerId   = ShowcaseSubcategoryAnswerId   Int
type GlobalTagId                   = GlobalTagId                   Int
type ShowcaseSourceId              = ShowcaseSourceId              Int
type ShowcaseSourceParentId        = ShowcaseSourceParentId        Int
type ShowcaseItemId                = ShowcaseItemId                Int
type ShowcaseRejectOptionId        = ShowcaseRejectOptionId        Int
type FileserviceId                 = FileserviceId                 Int
type ContextId                     = ContextId                     Int
type QualificationId               = QualificationId               Int
type InvoiceId                     = InvoiceId                     Int
type ProjectTemplateQuestionTextId = ProjectTemplateQuestionTextId Int 
type ProjectTemplateQuestionId     = ProjectTemplateQuestionId     Int 
type ProjectTemplateId             = ProjectTemplateId             Int 
type ProjectTemplateAnswerId       = ProjectTemplateAnswerId       Int
type ProjectAttachmentId           = ProjectAttachmentId           Int
type MembershipPackageId           = MembershipPackageId           Int
type JobBundleId                   = JobBundleId                   Int
type JobBundleCategoryId           = JobBundleCategoryId           Int
type JobId                         = JobId                         Int
type BidId                         = BidId                         Int
type PreferredFreelancerId         = PreferredFreelancerId         Int
type FacebookId                    = FacebookId                    Int
type FacebookAppId                 = FacebookAppId                 Int
type CurrencyId                    = CurrencyId                    Int
type FeaturedCouponId              = FeaturedCouponId              Int
type ShowcaseId                    = ShowcaseId                    Int
type FileId                        = FileId                        Int
type CoverImageId                  = CoverImageId                  Int
type CategoryId                    = CategoryId                    Int
type UserCompletedWorkId           = UserCompletedWorkId           Int
type MilestoneRequestId            = MilestoneRequestId            Int
type DisputeId                     = DisputeId                     Int
type TransactionId                 = TransactionId                 Int
type BadgeId                       = BadgeId                       Int
type ContestId                     = ContestId                     Int
type alias ShowcaseFileThumbnail   = Int
type alias TranslatorSignupState   = Int
type alias ReportState             = Int
type alias Timestamp               = Int
type alias Contest                 = Int
type alias ReviewAvailability      = Int
type alias DoubleRange             = (Float, Float)
type alias ShowcaseItems           = Int


