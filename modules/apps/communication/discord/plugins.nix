{ home, ... }: home {
	# to get an ok version of a json config:
	# ~/.config/Equicord/settings/settings.json => https://4evy.github.io/nixcord/#sec-converter

	programs.nixcord.config.plugins = {
		accountPanelServerProfile.enable = true;
		bannersEverywhere = {
			enable = true;
			preferNameplate = true;
		};
		betterActivities = {
			enable = true;
			allActivitiesStyle = "list";
		};
		betterAudioPlayer.enable = true;
		betterFolders = {
			enable = true;
			closeAllFolders = true;
			closeAllHomeButton = true;
			closeOthers = true;
			forceOpen = true;
			sidebar = false;
		};
		betterGifAltText.enable = true;
		betterGifPicker.enable = true;
		betterInvites.enable = true;
		betterPlusReacts.enable = true;
		betterSettings = {
			enable = true;
			disableFade = false;
		};
		betterUploadButton.enable = true;
		bypassPinPrompt.enable = true;
		callTimer.enable = true;
		channelTabs = {
			noPomeloNames = true;
		};
		clearUrls.enable = true;
		clickableRoles.enable = true;
		commandPalette = {
			enable = true;
			hotkey = [ "control" "shift" "p" ];
		};
		consoleJanitor.enable = true;
		copyFileContents.enable = true;
		crashHandler = {
			enable = true;
			attemptToNavigateToHome = true;
		};
		customFolderIcons.enable = true;
		customTimestamps = {
			formats = {
				enable = false;
			};
		};
		customUserColors.enable = true;
		disableCallIdle.enable = true;
		disableDeepLinks.enable = true;
		equicordHelper.enable = true;
		equicordToolbox.enable = true;
		experiments.enable = true;
		fakeNitro.enable = true;
		fakeProfileThemes.enable = true;
		favoriteEmojiFirst.enable = true;
		favoriteGifSearch.enable = true;
		findReply.enable = true;
		fixCodeblockGap.enable = true;
		fixFileExtensions.enable = true;
		fixImagesQuality.enable = true;
		fixSpotifyEmbeds.enable = true;
		fixYoutubeEmbeds.enable = true;
		forceOwnerCrown.enable = true;
		friendshipRanks.enable = true;
		friendTags.enable = true;
		fullSearchContext.enable = true;
		gameActivityToggle.enable = true;
		gifCollections.enable = true;
		globalBadges.enable = true;
		greetStickerPicker.enable = true;
		hideServers.enable = true;
		ignoreCalls.enable = true;
		implicitRelationships.enable = true;
		inRole.enable = true;
		inviteDefaults.enable = true;
		keywordNotify.enable = true;
		lastFmRichPresence.enable = false;
		loadingQuotes.enable = true;
		memberCount.enable = true;
		mentionAvatars.enable = true;
		messageClickActions.enable = true;
		messageColors.enable = true;
		messageLinkTooltip = {
			enable = true;
			display = "compact";
			onForward = false;
			onReply = false;
		};
		messageLogger.enable = true;
		messageLoggerEnhanced = {
			enable = true;
			blacklistedIds = "273534239310479360,628993209984614400";
			cacheMessagesFromServers = true;
			imageCacheDir = "/home/skultix/.config/Equicord/MessageLoggerData/savedImages";
			logsDir = "/home/skultix/.config/Equicord/MessageLoggerData";
			messageLimit = 300;
			saveImages = true;
			whitelistedIds = "1363445231206400150";
		};
		moreCommands.enable = true;
		moreUserTags = {
			enable = true;
			tagSettings = {
				administrator = {
					enable = false;
				};
				chatModerator = {
					enable = false;
				};
				moderator = {
					enable = false;
				};
				moderatorStaff = {
					enable = false;
				};
				owner = {
					enable = false;
				};
				voiceModerator = {
					enable = false;
				};
				webhook = {
					enable = false;
				};
				enable = false;
			};
		};
		mutualGroupDms.enable = true;
		newPluginsManager.enable = true;
		noDevtoolsWarning.enable = true;
		noF1.enable = true;
		noNitroUpsell.enable = true;
		noOnboardingDelay.enable = true;
		normalizeMessageLinks.enable = true;
		notificationTitle.enable = true;
		noUnblockToJump.enable = true;
		permissionFreeWill.enable = true;
		permissionsViewer.enable = true;
		petpet.enable = true;
		pictureInPicture.enable = true;
		pinDms = {
			enable = true;
			userBasedCategoryList = {
				"182377810722029568" = [ ];
			};
		};
		pinIcon.enable = true;
		profileSets = {
			avatarSize = 40.0;
		};
		questify = {
			enable = true;
			ignoredQuestIds = {
				questIDs = [ ];
			};
			questButtonDisplay = "unclaimed";
			resumeQuestIds = {
				watch = [ ];
				play = [ ];
				achievement = [ ];
			};
		};
		quickReply.enable = true;
		quoter.enable = true;
		reactErrorDecoder.enable = true;
		recentDmSwitcher.enable = true;
		relationshipNotifier.enable = true;
		remixRevived.enable = true;
		revealAllSpoilers.enable = true;
		reverseImageSearch.enable = true;
		scheduledMessages.enable = true;
		searchFix.enable = true;
		sendTimestamps.enable = true;
		serverListIndicators.enable = true;
		shikiCodeblocks = {
			enable = true;
			theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/bc5436518111d87ea58eb56d97b3f9bec30e6b83/packages/tm-themes/themes/tokyo-night.json";
			useDevIcon = "COLOR";
		};
		showAllMessageButtons.enable = true;
		showConnections.enable = true;
		showHiddenChannels.enable = true;
		showHiddenThings.enable = true;
		showMessageEmbeds.enable = true;
		silentTyping = {
			enable = true;
			disabledLocations = "1338412507370492009";
		};
		sortFriends.enable = true;
		splitLargeMessages.enable = true;
		spotifyCrack.enable = true;
		startupTimings.enable = true;
		statusPresets.enable = true;
		stickerPaste.enable = true;
		textReplace = {
			enable = true;
			regexRules = [
				# {
				# 	find = "";
				# 	replace = "";
				# 	onlyIfIncludes = "";
				# 	scope = "myMessages";
				# }
			];
			stringRules = [
				# {
				# 	find = "";
				# 	replace = "";
				# 	onlyIfIncludes = "";
				# 	scope = "myMessages";
				# }
			];
		};
		themeAttributes.enable = true;
		themeLibrary = {
			enable = true;
			hideWarningCard = true;
		};
		timezones = {
			enable = true;
			_24hTime = true;
			askedTimezone = true;
			showMessageHeaderTime = false;
		};
		typingIndicator.enable = true;
		typingTweaks.enable = true;
		unindent.enable = true;
		unitConverter = {
			myUnits = "metric";
		};
		userPfp.enable = false;
		userVoiceShow.enable = true;
		usrbg.enable = false;
		validReply.enable = true;
		validUser.enable = true;
		vcNarratorCustom = {
			customVoice = "en_au_001";
		};
		voiceChatUtilities.enable = true;
		voiceDownload.enable = true;
		voiceMessages.enable = true;
		volumeBooster.enable = true;
		webContextMenus = {
			enable = true;
			addBack = true;
		};
		webKeybinds.enable = true;
		webScreenShareFixes.enable = true;
		whoReacted.enable = true;
		whosWatching.enable = true;
		youtubeAdblock.enable = true;
		zipPreview.enable = true;
	};
	programs.nixcord.extraConfig.plugins = {
		Anammox = {
			enable = true;
			dms = true;
			billing = false;
			gift = true;
			emojiList = false;
			serverBoost = true;
			quests = false;
		};
		BANger = {
			source = "https://i.imgur.com/wp5q52C.mp4";
		};
		betterAudioPlayer = {
			forceMoveBelow = true;
		};
		BetterQuickReact = {
			frequentEmojis = true;
			rows = 2;
			columns = 4;
			compactMode = false;
			scroll = true;
		};
		commandPalette = {
			allowMouseControl = true;
		};
		customFolderIcons = {
			folderIcons = {
				"3995713659" = {
					url = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/4f909e2c-8c5b-437c-b13c-0118300021ed/dh58r5x-0797344d-c721-4a84-a481-8c57f7029bdc.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzRmOTA5ZTJjLThjNWItNDM3Yy1iMTNjLTAxMTgzMDAwMjFlZFwvZGg1OHI1eC0wNzk3MzQ0ZC1jNzIxLTRhODQtYTQ4MS04YzU3ZjcwMjliZGMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.lW0FQBPtadYOdyg24U3mB7vRfvOVwqPrUIb0oqkAp_w";
					size = 148;
				};
				"4074387611" = {
					url = "https://i.imgur.com/b6CYZAG.png";
					size = 100;
				};
			};
		};
		customTimestamps = {
			cozyFormat = "[calendar]";
			compactFormat = "LT";
			tooltipFormat = "LLLL • [relative]";
			sameDayFormat = "HH:mm:ss";
			lastDayFormat = "[yesterday] HH:mm:ss";
			lastWeekFormat = "ddd DD.MM.YYYY HH:mm:ss";
			sameElseFormat = "ddd DD.MM.YYYY HH:mm:ss";
		};
		declutter = {
			removeShopAboveDM = false;
			removeQuestsAboveDM = false;
		};
		Demonstration = {
			keyBind = "F6";
			soundVolume = 0.5;
			showConfirmationModal = true;
		};
		Downloadify = {
			enable = true;
			displayStatus = true;
			statusDuration = 2.5;
			voiceMessages = true;
			allowUnicode = true;
			overwriteFiles = false;
			defaultDirectory = "/home/themarlstar/Downloads";
		};
		EquicordCSS = {
			betterAuthApps = true;
			betterStatusPicker = false;
			discordicons = false;
			gradientButtons = false;
			nitroThemesFix = false;
			settingsIcons = false;
			userReimagined = false;
		};
		equicordHelper = {
			hideClanBadges = false;
			disableCreateDMButton = true;
			disableDMContextMenu = false;
			noDefaultHangStatus = false;
		};
		fakeNitro = {
			useHyperLinks = true;
		};
		FakeProfileThemesAndEffects = {
			prioritizeNitro = false;
			hideBuilder = false;
		};
		fontLoader = {
			applyOnClodeBlocks = false;
		};
		GifRoulette = {
			pingOwnerChance = true;
		};
		globalBadges = {
			showRa1ncord = true;
			showReplugged = true;
		};
		ignoreCalls = {
			ignoreTimeout = 2500;
		};
		JellyfinRichPresence = {
			nameDisplay = "default";
			overrideRichPresenceType = false;
		};
		lastFmRichPresence = {
			shareSong = true;
			alwaysHideArt = false;
		};
		MediaDownloader = {
			enable = true;
			showProgress = true;
			showFfmpegWarning = true;
			defaultGifQuality = 3;
		};
		messageClickActions = {
			enableDeleteOnClick = true;
			enableDoubleClickToEdit = true;
			enableDoubleClickToReply = true;
			requireModifier = false;
			keySelection = "backspace";
		};
		messageLoggerEnhanced = {
			autoCheckForUpdates = true;
		};
		noBlockedMessages = {
			applyToIgnoredUsers = true;
			ignoreBlockedMessages = false;
			ignoreMessages = false;
		};
		orbolayBridge = {
			messageAlignment = "topright";
			userAlignment = "topleft";
			voiceSemitransparent = true;
			messagesSemitransparent = true;
		};
		pinDms = {
			disableCreateDMButton = true;
		};
		platformIndicators = {
			badges = true;
		};
		questify = {
			disableQuestsDiscoveryTab = false;
			disableQuestsFetchingQuests = false;
			disableQuestsPopupAboveAccountPanel = true;
			disableQuestsBadgeOnUserProfiles = false;
			disableQuestsGiftInventoryRelocationNotice = true;
			disableFriendsListActiveNowPromotion = true;
			makeMobileQuestsDesktopCompatible = true;
			completeVideoQuestsInBackground = true;
			completeGameQuestsInBackground = true;
			questButtonUnclaimed = "both";
			fetchingQuestsInterval = 1800;
			fetchingQuestsAlert = "discodo";
			restyleQuestsUnclaimed = 2842239;
			restyleQuestsClaimed = 6105983;
			restyleQuestsIgnored = 8334124;
			restyleQuestsExpired = 2368553;
			restyleQuestsGradient = "intense";
			restyleQuestsPreload = true;
			ignoredQuests = "";
			reorderQuests = "UNCLAIMED, CLAIMED, IGNORED, EXPIRED";
			unclaimedUnignoredQuests = 5;
			onQuestsPage = false;
			triggerQuestsRerender = false;
			ignoredQuestProfile = "private";
			questRewardIncludeRewardCode = true;
			questRewardIncludeNitroCode = true;
			questRewardIncludeCollectibles = true;
			questRewardIncludeInGame = true;
			questRewardIncludeOrbs = true;
			disableQuestsDirectMessagesTab = false;
			disableMembersListActivelyPlayingIcon = true;
			fetchingQuestsAlertVolume = 100;
			disableQuestsPageSponsoredBanner = false;
			completeAchievementQuestsInBackground = false;
		};
		quoter = {
			userIdentifier = 0;
		};
		remixRevived = {
			remixTag = true;
		};
		showHiddenChannels = {
			hideUnreads = true;
		};
		showHiddenThings = {
			disableDiscoveryFilters = true;
			disableDisallowedDiscoveryFilters = true;
		};
		showMeYourName = {
			displayNames = false;
			friendNicknames = "dms";
			inReplies = false;
			mode = "user-nick";
		};
		silentTyping = {
			contextMenu = true;
			isEnabled = false;
			showIcon = true;
			blockAllTypingIndicators = false;
			blockAllIsTyping = false;
			blockEverything = false;
		};
		TextToSpeech = {
			apiKey = "";
			voiceToUse = "nova";
		};
		TimelessClips = {
			clipLength = 5;
		};
		translate = {
			shavian = true;
			sitelen = true;
			target = "en";
			toki = true;
		};
		userPfp = {
			urlForDB = "https://userpfp.github.io/UserPFP/source/data.json";
			databaseToUse = "https://userpfp.github.io/UserPFP/source/data.json";
		};
		vcNarratorCustom = {
			muteMessage = "{{DISPLAY_NAME}} Muted";
			unmuteMessage = "{{DISPLAY_NAME}} unmuted";
			deafenMessage = "{{DISPLAY_NAME}} deafened";
			undeafenMessage = "{{DISPLAY_NAME}} undeafened";
		};
		VencordRPC = {
			userAvatarAsSmallImage = false;
			exposeDmsUsername = false;
			type = 0;
			timestampMode = 0;
		};
		VideoSpeed = {
			enable = true;
			preservePitch = false;
		};
		WallpaperFree = {
			enable = true;
			forceReplace = false;
		};
	};
}
