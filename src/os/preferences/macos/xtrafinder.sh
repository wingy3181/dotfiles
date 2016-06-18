#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n  XtraFinder\n\n"

execute "defaults write com.apple.finder XtraFinder_ShowStatusBarIcon -bool false" \
    "Tools -> Hide Menu Bar Icon (enable)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "defaults write com.apple.finder XtraFinder_XFTabPlugin -bool true" \
    "Tabs -> Tabs (enable)"

execute "defaults write com.apple.finder XtraFinder_XFTabPlugin_NewTabWithSamePath -bool false" \
    "Tabs -> Open new tab with same path (disable)"

execute "defaults write com.apple.finder XtraFinder_XFTabPlugin_SaveOpenTabs -bool true" \
    "Tabs -> Save open tabs when quitting Finder (enable)"

execute "defaults write com.apple.finder XtraFinder_XFTabPlugin_UseSelectTabShortcuts -bool false" \
    "Tabs -> Use Command+Number shortcuts to switch tab (disable)"

execute "defaults write com.apple.finder XtraFinder_XFTabPlugin_NarrowTabBar -bool false" \
    "Tabs -> Narrow Tab Bar (disable)"

# 0=Chrome, 1=Opera
execute "defaults write com.apple.finder XtraFinder_XFTabPlugin_TabStyle -int 0" \
    "Tabs -> Narrow Tab Bar -> Tab style (Chrome)"

execute "defaults write com.apple.finder XtraFinder_XFTabPlugin_PreferOpenNewWindow -bool false" \
    "Tabs -> Open directory (from Desktop or external app) in new window (disable)"

execute "defaults write com.apple.finder XtraFinder_XFTabPlugin_ShowSecondSidebar -bool false" \
    "Tabs -> Dual Panel mode -> Show the second Sidebar (disable)"

execute "defaults write com.apple.finder XtraFinder_XFTabPlugin_MiddleClickOpenInSecondPanel -bool false" \
    "Tabs -> Dual Panel mode -> Middle-click on Sidebar to open in the second panel (disable)"

execute "defaults write com.apple.finder XtraFinder_XFTabPlugin_ShiftClickOpenInSecondPanel -bool true" \
    "Tabs -> Dual Panel mode -> Shift+Click on Sidebar to open in the second panel (enable)"

execute "defaults write com.apple.finder XtraFinder_XFTabPlugin_ShowPinButton -bool true" \
    "Tabs -> Show the Pin button (enable)"

execute "defaults write com.apple.finder XtraFinder_XFTabPlugin_PinnableWindow_Slide -bool true" \
    "Tabs -> Slide from (enable)"

# 0=Bottom, 1=Left, 2=Top, 3=Right
execute "defaults write com.apple.finder XtraFinder_XFTabPlugin_PinnableWindow_SlideFrom -int 0" \
    "Tabs -> Slide from Bottom"

execute "defaults write com.apple.finder XtraFinder_XFTabPlugin_PreferPinnableWindow -bool false" \
    "Tabs -> Always open new tab in the Pinnable window (disable)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "defaults write com.apple.finder XtraFinder_XFCutAndPastePlugin -bool true" \
    "Features -> Cut & Paste (enable)"

execute "defaults write com.apple.finder XtraFinder_XFCopyQueuePlugin -bool false" \
    "Features -> Copy & Paste queue. Only works with Paste command. (disable)"

execute "defaults write com.apple.finder XtraFinder_XFHideDotFilesOnDesktopPlugin -bool true" \
    "Features -> Hide dot files on Desktop (enable)"

execute "defaults write com.apple.finder XtraFinder_XFAlwaysMaximizePlugin -bool false" \
    "Features -> Maximize window when zooming (disable)"

execute "defaults write com.apple.finder XtraFinder_XFAutoArrangeByNamePlugin -bool false" \
    "Features -> Arrange items by Name in Icons View (disable)"

execute "defaults write com.apple.finder XtraFinder_XFSpringLoadedPathBarPlugin -bool false" \
    "Features -> Spring-loaded Path Bar (disable)"

execute "defaults write com.apple.finder XtraFinder_XFPathBarBreadcrumbMenuPlugin -bool false" \
    "Features -> Click any item in the Path Bar to show contents menu (disable)"

execute "defaults write com.apple.finder XtraFinder_XFSortRecentFoldersPlugin -bool false" \
    "Features -> Sort Recent Folders menu by last opened date (disable)"

execute "defaults write com.apple.finder XtraFinder_XFFitColumnWidthPlugin -bool false" \
    "Features -> Automatically adjust width of columns (disable)"
execute "defaults write com.apple.finder XtraFinder_XFFitColumnWidthPlugin_Name -bool true" \
    "Features -> Automatically adjust width of columns -> Name (disable)"
execute "defaults write com.apple.finder XtraFinder_XFFitColumnWidthPlugin_HasMinWidth -bool false" \
    "Features -> Automatically adjust width of columns -> Min Width (disable)"
execute "defaults write com.apple.finder XtraFinder_XFFitColumnWidthPlugin_MinWidth -int 110" \
    "Features -> Automatically adjust width of columns -> Min Width amount"
execute "defaults write com.apple.finder XtraFinder_XFFitColumnWidthPlugin_HasMaxWidth -bool false" \
    "Features -> Automatically adjust width of columns -> Max Width (disable)"
execute "defaults write com.apple.finder XtraFinder_XFFitColumnWidthPlugin_MaxWidth -int 110" \
    "Features -> Automatically adjust width of columns -> Max Width amount"
execute "defaults write com.apple.finder XtraFinder_XFFitColumnWidthPlugin_Padding -int 10" \
    "Features -> Automatically adjust width of columns -> Padding amount"
execute "defaults write com.apple.finder XtraFinder_XFFitColumnWidthPlugin_Date -bool false" \
    "Features -> Automatically adjust width of columns -> Date (disable)"
execute "defaults write com.apple.finder XtraFinder_XFFitColumnWidthPlugin_Size -bool false" \
    "Features -> Automatically adjust width of columns -> Size (disable)"
execute "defaults write com.apple.finder XtraFinder_XFFitColumnWidthPlugin_Version -bool false" \
    "Features -> Automatically adjust width of columns -> Version (disable)"
execute "defaults write com.apple.finder XtraFinder_XFFitColumnWidthPlugin_Kind -bool false" \
    "Features -> Automatically adjust width of columns -> Kind (disable)"
execute "defaults write com.apple.finder XtraFinder_XFFitColumnWidthPlugin_Comment -bool false" \
    "Features -> Automatically adjust width of columns -> Comment (disable)"
execute "defaults write com.apple.finder XtraFinder_XFFitColumnWidthPlugin_Label -bool false" \
    "Features -> Automatically adjust width of columns -> Label (disable)"

execute "defaults write com.apple.finder XtraFinder_XFBrowserViewMiddleClickPlugin -bool false" \
    "Features -> Middle-click to open folder in new window or new tab (disable)"

execute "defaults write com.apple.finder XtraFinder_XFEnterToOpenPlugin -bool false" \
    "Features -> Press Enter to open selection (disable)"

execute "defaults write com.apple.finder XtraFinder_XFRenameActionPlugin -bool false" \
    "Features -> Rename (disable)"

execute "defaults write com.apple.finder XtraFinder_XFBackspaceToGoBackPlugin -bool false" \
    "Features -> Press Backspace (Backward Delete) to Go Back (disable)\n \
                 Press Delete (Forward Delete) to Move to Trash (disable)"

execute "defaults write com.apple.finder XtraFinder_XFLabelShortcutsPlugin -bool false" \
    "Features -> Use Command-Alt-Shift+Number shortcuts to set Label (disable)"

execute "defaults write com.apple.finder XtraFinder_XFFolderItemCountPlugin -bool false" \
    "Features -> Display folder item count in List view (disable)"

execute "defaults write com.apple.finder XtraFinder_XFAlwaysShowToolbarPlugin -bool false" \
    "Features -> Always show Toolbar (disable)"

execute "defaults write com.apple.finder XtraFinder_XFGoUpToolbarButtonPlugin -bool false" \
    "Features -> Show Go Up button in the toolbar (disable)"

execute "defaults write com.apple.finder XtraFinder_XFToolbarButtonService -bool false" \
    "Features -> Add XtraFinder's functions to the toolbar (disable)"

execute "defaults write com.apple.finder XtraFinder_XFHideShareItemPlugin -bool false" \
    "Features -> Hide Share item in the content menu (disable)"

execute "defaults write com.apple.finder XtraFinder_XFSizeOfSelectedItemsInStatusBarPlugin -bool false" \
    "Features -> Show total size of selected items in Status Bar (disable)"

execute "defaults write com.apple.finder XtraFinder_XFSizeOfSelectedItemsInStatusBarPlugin_AutoCalculate -bool false" \
    "Features -> Show total size of selected items in Status Bar -> Automatically calculate size (disable)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "defaults write com.apple.finder XtraFinder_XFTransparentWindowPlugin -bool false" \
    "Appearance -> Transparent window (disable)"

execute "defaults write com.apple.finder XtraFinder_XFBrowserViewColorPlugin -bool false" \
    "Appearance -> Light text on dark background (disable)"

execute "defaults write com.apple.finder XtraFinder_XFColorfulSidebarPlugin -bool false" \
    "Appearance -> Show colorful icons in the sidebar (disable)"

execute "defaults write com.apple.finder XtraFinder_XFLabelsInSidebarPlugin -bool false" \
    "Appearance -> Show label color in the sidebar (disable)"

execute "defaults write com.apple.finder XtraFinder_XFLegacyLabelPlugin -bool false" \
    "Appearance -> Legacy label color painting (disable)"

execute "defaults write com.apple.finder XtraFinder_XFLegacyLabelForIconViewPlugin -bool false" \
    "Appearance -> Legacy label color painting -> Enabled for Icon View mode (disable)"

execute "defaults write com.apple.finder XtraFinder_XFLegacyLabelForDesktopPlugin -bool false" \
    "Appearance -> Legacy label color painting -> Enabled for Desktop (disable)"

execute "defaults write com.apple.finder XtraFinder_XFLegacyZoomButtonPlugin -bool false" \
    "Appearance -> Swap Zoom button and Fullscreen button (disable)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "defaults write com.apple.finder XtraFinder_XFCopyPathMenuPlugin -bool true" \
    "Add items to Finder menus -> Copy Path (enable)"
#0=Path, 1=URL, 2=Windows Path, 3=HFS Path, 4=Terminal Path, 5=Short Path, 6=Short URL, 7=Name
execute "defaults write com.apple.finder XtraFinder_XFCopyPathMenuPlugin_Default -int 0" \
    "Add items to Finder menus -> Copy Path > Default -> Path"

execute "defaults write com.apple.finder XtraFinder_XFAttributesMenuPlugin -bool false" \
    "Add items to Finder menus -> Attributes (disable)"

execute "defaults write com.apple.finder XtraFinder_XFContentsMenuPlugin -bool false" \
    "Add items to Finder menus -> Contents (disable)"

execute "defaults write com.apple.finder XtraFinder_XFOpenInNewWindowPlugin -bool false" \
    "Add items to Finder menus -> Open in New Window (disable)"

execute "defaults write com.apple.finder XtraFinder_XFShowAllFilesActionPlugin -bool false" \
    "Add items to Finder menus -> Show Hidden Items (disable)"

execute "defaults write com.apple.finder XtraFinder_XFHideDesktopActionPlugin -bool false" \
    "Add items to Finder menus -> Hide Desktop (disable)"

execute "defaults write com.apple.finder XtraFinder_XFCollapseAllActionPlugin -bool false" \
    "Add items to Finder menus -> Collapse All (disable)"

execute "defaults write com.apple.finder XtraFinder_XFRefreshActionPlugin -bool true" \
    "Add items to Finder menus -> Refresh (enable)"

execute "defaults write com.apple.finder XtraFinder_XFLaunchAsRootActionPlugin -bool false" \
    "Add items to Finder menus -> Launch as Root (disable)"

execute "defaults write com.apple.finder XtraFinder_XFMakeSymbolicLinkActionPlugin -bool false" \
    "Add items to Finder menus -> Make Symbolic Link (disable)"

execute "defaults write com.apple.finder XtraFinder_XFNewTerminalActionPlugin -bool true" \
    "Add items to Finder menus -> New Terminal Here (enable)"

# 0=Terminal, 1=iTerm, 2=XTerm
execute "defaults write com.apple.finder XtraFinder_XFNewTerminalActionPlugin_TerminalApp -int 0" \
    "Add items to Finder menus -> New Terminal Here -> Terminal"

execute "defaults write com.apple.finder XtraFinder_XFNewFileActionPlugin -bool true" \
    "Add items to Finder menus -> New File... (enable)"

execute "defaults write com.apple.finder XtraFinder_XFCopyToActionPlugin -bool false" \
    "Add items to Finder menus -> Copy to... (disable)\n \
                                  Move to... (disable)"

execute "defaults write com.apple.finder XtraFinder_XFPermanentDeletePlugin -bool false" \
    "Add items to Finder menus -> Delete Permanently (disable)"

execute "defaults write com.apple.finder XtraFinder_XFSelectActionPlugin -bool false" \
    "Add items to Finder menus -> Select... (disable)"

execute "defaults write com.apple.finder XtraFinder_XFInvertSelectionActionPlugin -bool false" \
    "Add items to Finder menus -> Invert Selection (disable)"

execute "defaults write com.apple.finder XtraFinder_XFWindowTopMostActionPlugin -bool false" \
    "Add items to Finder menus -> Top Most (disable)"

execute "defaults write com.apple.finder XtraFinder_XFDualWindowActionPlugin -bool false" \
    "Add items to Finder menus -> Dual Window - Horizontal (disable)\n \
                                  Dual Window - Vertical (disable)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# https://www.trankynam.com/xtrafinder/sip.html
# http://apple.stackexchange.com/questions/208478/how-do-i-disable-system-integrity-protection-sip-aka-rootless-on-os-x-10-11
# This is so that XtraFinder works on OS X 10,11 - El Capitan
execute "csrutil enable --without debug" \
    "Partially disable System Integrity Protection"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

killall "Finder" &> /dev/null
