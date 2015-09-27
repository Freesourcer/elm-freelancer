module Freelancer.Requests where


--Start of User Section
linkFacebook             = "POST /api/users/0.1/users/facebook/link/"
signupFacebookAccount    = "POST /api/users/0.1/users/facebook/"
checkUserInformation     = "POST /api/users/0.1/users/check/"
newUserSignup            = "POST /api/users/0.1/users/"
getUserInformation       = "GET /api/users/0.1/users/"
updateProfile            = "POST /api/users/0.1/self/profile/"
uploadProfilePicture     = "POST /api/users/0.1/self/profile_picture/"
getUsers                 = "GET /api/users/0.1/users/self/"
getUserById              = "GET /api/users/0.1/users/{user_id}/"
addJobs                  = "POST /api/users/0.1/self/jobs/"
setJobs                  = "PUT/PATCH /api/users/0.1/self/jobs/"
deleteJobs               = "DELETE /api/users/0.1/self/jobs/"
postFeedback             = "POST /api/users/0.1/feedback/"
addOrUpdateToken         = "PUT/PATCH /api/users/0.1/tokens/{kind}/{data}/"
deleteToken              = "DELETE /api/users/0.1/tokens/{kind}/{data}/"
checkTokens              = "GET /api/users/0.1/tokens/{kind}/"
getReputation            = "GET /api/users/0.1/reputations/"
requestPhoneVerification = "POST /api/users/0.1/phone_verifications/"
phoneVerificationAction  = "PUT/PATCH /api/users/0.1/phone_verifications/"
--End of User Section

--Start of Project Section
createNewProject            = "POST /api/projects/0.1/projects/"
projectActions              = "PUT/PATCH /api/projects/0.1/projects/"
searchForProjects           = "GET /api/projects/0.1/projects/active/"
inviteToProject             = "POST /api/projects/0.1/projects/{project_id}/invite/"
getUpgradeFees              = "GET /api/projects/0.1/projects/fees/"
getProjects                 = "GET /api/projects/0.1/projects/"
getProjectById              = "GET /api/projects/0.1/projects/{project_id}/"
getProjectBySeo             = "GET /api/projects/0.1/projects/{seo_url}/"
getProjectBids              = "GET /api/projects/0.1/projects/{project_id}/bids/"
getProjectBidInformation    = "GET /api/projects/0.1/projects/{project_id}/bidinfo/"
getProjectMilestoneRequests = "GET /api/projects/0.1/projects/{project_id}/milestone_requests/"
getProjectMilestones        = "GET /api/projects/0.1/projects/{project_id}/milestones/"
getBids                     = "GET /api/projects/0.1/bids/"
getBidById                  = "GET /api/projects/0.1/bids/{bid_id}/"
bidOnAProject               = "POST /api/projects/0.1/bids/"
updateExistingBid           = "PUT/PATCH /api/projects/0.1/bids/{bid_id}/" --command duplicated?
performBidAction            = "PUT/PATCH /api/projects/0.1/bids/{bid_id}/" --command duplicated?
setBidAwardStatus           = "PUT/PATCH /api/projects/0.1/bids/{bid_id}/award_status/"
getJobs                     = "GET /api/projects/0.1/jobs/"
getJobBundles               = "GET /api/projects/0.1/job_bundles/"
getJobBundleCategories      = "GET /api/projects/0.1/job_bundle_categories/"
getMilestoneRequests        = "GET /api/projects/0.1/milestone_requests/"
createAProjectMilestone     = "POST /api/projects/0.1/milestone_requests/"
milestoneRequestAction      = "PUT/PATCH /api/projects/0.1/milestone_requests/{milestone_request_id}/"
getMilestones               = "GET /api/projects/0.1/milestones/"
createAMilestone            = "POST /api/projects/0.1/milestones/"
milestoneAction             = "PUT/PATCH /api/projects/0.1/milestone_requests/{milestone_id}/"
getProjectReviews           = "POST /api/projects/0.1/reviews/" --command duplicated?
postAReview                 = "POST /api/projects/0.1/reviews/"--command duplicated?
getActiveProjectTemplates   = "GET /api/projects/0.1/project_templates/"
getCurrencies               = "GET /api/projects/0.1/currencies/"
getCategories               = "POST /api/projects/0.1/categories/"
getBudgets                  = "GET /api/projects/0.1/budgets/"
projectPing                 = "GET /api/projects/0.1/ping/"
--End of Project Section

--Start of Messaging Section
createNewThread          = "POST /api/messages/0.1/threads/"
addNewMessageToThread    = "POST /api/messages/0.1/threads/{thread_id}/messages/"
searchThreadsForMessages = "GET /api/messages/0.1/threads/search/"
getThreads               = "GET /api/messages/0.1/threads/"
updateThreads            = "PUT/PATCH /api/messages/0.1/threads/"
sendTypingNotification   = "POST /api/messages/0.1/threads/{thread_id}/typing/"
getThreadById            = "GET /api/messages/0.1/threads/{thread_id}/"
addRemoveUsersFromThread = "PUT/PATCH /api/messages/0.1/threads/{thread_id}/members/"
getMessages              = "POST /api/messages/0.1/messages/"
messageActions           = "PUT/PATCH /api/messages/0.1/messages/"
getMessageById           = "GET /api/messages/0.1/messages/{message_id}/"
videoChatRequest         = "POST /api/messages/0.1/videochat/{thread_id}/"
videoChatIceConfig       = "GET /api/messages/0.1/videochat/{thread_id}/ice_config"
videoChatAction          = "PUT/PATCH /api/messages/0.1/videochat/{thread_id}/"
messagesPing             = "GET /api/messages/0.1/ping/"
--End of Messaging Section

--Start of Contacts Section
createRequest              = "POST /api/contacts/0.1/requests/pending_sent/"
rejectRequest              = "DELETE /api/contacts/0.1/requests/pending_received/{user_id}/"
cancelRequest              = "DELETE /api/contacts/0.1/requests/pending_sent/{user_id}/"
getReceivedRequests        = "GET /api/contacts/0.1/requests/pending_received/"
updateReceivedRequests     = "PUT/PATCH /api/contacts/0.1/requests/pending_received/" --Typo in documentation "Update Recieved Requests"
updateReceivedRequestsById = "PUT/PATCH /api/contacts/0.1/requests/pending_received/{user_id}/" --Typo as above
getSentRequests            = "GET /api/contacts/0.1/requests/pending_sent/"
updateSentRequests         = "PUT/PATCH /api/contacts/0.1/requests/pending_sent/"
getFriendRequests          = "GET /api/contacts/0.1/requests/"
reportUser                 = "POST /api/contacts/0.1/reports/{user_id}/"
getSuggestedFriends        = "GET /api/contacts/0.1/suggested_friends/"
getContacts                = "GET /api/contacts/0.1/contacts/"
updateContacts             = "PUT/PATCH /api/contacts/0.1/contacts/"
getContactById             = "GET /api/contacts/0.1/contacts/{user_id}/"
contactsPing               = "GET /api/contacts/0.1/ping/"
--End of Contacts Section

--Start of Payments Section
authorizeDeposit  = "PUT /api/payments/0.1/authorize/"
setUpNewDeposit   = "POST /api/payments/0.1/deposits/"
confirmNewDeposit = "PUT /api/payments/0.1/deposits/"
getFees           = "GET /api/payments/0.1/deposits/fees/"
paymentsPing      = "GET /api/payments/0.1/ping/"
--End of Payments Section

--Start of Translations section
getTranslations               = "GET /api/translations/0.1/translations/"
addTranslations               = "POST /api/translations/0.1/translations/"
getLanguages                  = "GET /api/translations/0.1/languages/"
getReports                    = "GET /api/translations/0.1/reports/"
getReportsById                = "GET /api/translations/0.1//reports/" --Error, double slash, otherwise duplicate of above
createReport                  = "POST /api/translations/0.1/reports/"
reportActions                 = "PUT/PATCH /api/translations/0.1/reports/"
createReportReason            = "POST /api/translations/0.1/report_reasons/"
getReportReasons              = "GET /api/translations/0.1/report_reasons/"
deleteTranslationReportReason = "DELETE /api/translations/0.1/report_reasons/"
modifyTranslationReportReason = "PUT/PATCH /api/translations/0.1/report_reasons/"
getTranslator                 = "GET /api/translations/0.1/translator/"
newTranslator                 = "POST /api/translations/0.1/translators/"
--End of Translations section

--Start of Memberships section
getMembershipPackages = "GET /api/memberships/0.1/packages/"
packageSubscription   = "PUT/PATCH /api/memberships/0.1/packages/"
benefitsGet           = "PUT/PATCH /api/memberships/0.1/benefits/"
membershipsPing       = "GET /api/memberships/0.1/ping/"
--End of Memberships section

