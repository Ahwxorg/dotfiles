# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

import subprocess
import catppuccin

config.load_autoconfig()

# set the flavour you'd like to use. valid options are 'mocha', 'macchiato', 'frappe', and 'latte'
catppuccin.setup(c, 'mocha')

config.bind("<Windows-1>", "tab-focus 1")
config.bind("<Windows-2>", "tab-focus 2")
config.bind("<Windows-3>", "tab-focus 3")
config.bind("<Windows-4>", "tab-focus 4")
config.bind("<Windows-5>", "tab-focus 5")
config.bind("<Windows-6>", "tab-focus 6")
config.bind("<Windows-7>", "tab-focus 7")
config.bind("<Windows-8>", "tab-focus 8")
config.bind("<Windows-9>", "tab-focus 9")
config.bind("<Windows-0>", "tab-focus 10")
config.bind("<Windows-l>", "tab-next")
config.bind("<Windows-h>", "tab-prev")

config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

config.bind('pm', 'hint links spawn --detach mpv {hint-url}')
config.bind('pm', 'spawn --userscript ~/.qutebrowser/userscripts/mpv')

# When to show favicons in the tab bar. Valid values:
#   - always: Always show favicons.
#   - never: Always hide favicons.
#   - pinned: Show favicons only on pinned tabs.
c.tabs.favicons.show = 'pinned'
c.auto_save.session = True
c.content.javascript.alert = True
c.tabs.indicator.width = 0
c.colors.webpage.preferred_color_scheme = "dark";
c.colors.webpage.bg = 'Black'
c.colors.webpage.darkmode.enabled = True

c.content.blocking.adblock.lists = ['https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt', 'https://easylist-downloads.adblockplus.org/easylistdutch.txt', 'https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt', 'https://www.i-dont-care-about-cookies.eu/abp/', 'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt']
c.url.searchengines = {'DEFAULT': 'https://search.ahwx.org/search.php?q={}'}
c.url.start_pages = 'file:///Users/ahwx/Development/Esty/index.html'
c.fonts.completion.entry = '500 10pt monospace'
c.fonts.completion.category = 'bold 10pt monospace'
c.fonts.debug_console = '500 10pt monospace'
c.fonts.downloads = '500 10pt monospace'
c.fonts.hints = 'bold 10pt monospace'
c.fonts.keyhint = '500 10pt monospace'
c.fonts.messages.error = '500 10pt monospace'
c.fonts.messages.info = '500 10pt monospace'
c.fonts.messages.warning = '500 10pt monospace'
c.fonts.prompts = '500 10pt monospace'
c.fonts.statusbar = '1000 10pt monospace'

# This breaks yabai's auto tiling.
# c.window.hide_decoration = True

# COLORS

########        def read_xresources(prefix):
########            props = {}
########            x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
########            lines = x.stdout.decode().split('\n')
########            for line in filter(lambda l : l.startswith(prefix), lines):
########                prop, _, value = line.partition(':\t')
########                props[prop] = value
########            return props
########        
########        xresources = read_xresources('*')
########        c.colors.completion.fg = xresources['*.foreground']
########        c.colors.completion.odd.bg = xresources['*.background']
########        #c.colors.completion.even.bg = xresources['*.background-even']
########        c.colors.completion.category.bg = xresources['*.background']
########        c.colors.completion.category.border.top = xresources['*.background']
########        c.colors.completion.category.border.bottom = xresources['*.background']
########        c.colors.completion.item.selected.bg = xresources['*.foreground']
########        c.colors.completion.item.selected.border.bottom = xresources['*.foreground']
########        c.colors.completion.item.selected.border.top = xresources['*.foreground']
########        c.colors.completion.item.selected.fg = xresources['*.background']
########        c.colors.completion.match.fg = xresources['*.color9']
########        #c.colors.completion.scrollbar.fg = xresources['*.background-even']
########        c.colors.completion.scrollbar.bg = xresources['*.background']
########        c.colors.downloads.bar.bg = xresources['*.background']
########        c.colors.downloads.start.bg = xresources['*.color4']
########        c.colors.downloads.stop.bg = xresources['*.color2']
########        c.colors.messages.error.fg = xresources['*.foreground']
########        c.colors.messages.error.bg = xresources['*.color1']
########        c.colors.messages.error.border = xresources['*.color1']
########        c.colors.messages.warning.bg = xresources['*.color3']
########        c.colors.messages.warning.border = xresources['*.color3']
########        c.colors.messages.info.bg = xresources['*.color8']
########        c.colors.messages.info.border = xresources['*.color8']
########        c.colors.prompts.bg = xresources['*.color8']
########        c.colors.prompts.fg = xresources['*.foreground']
########        c.colors.statusbar.normal.bg = xresources['*.background']
########        c.colors.statusbar.normal.fg = xresources['*.foreground']
########        c.colors.statusbar.insert.bg = xresources['*.background']
########        c.colors.statusbar.insert.fg = xresources['*.color10']
########        c.colors.statusbar.passthrough.fg = xresources['*.color12']
########        c.colors.statusbar.passthrough.bg = xresources['*.background']
########        c.colors.statusbar.command.fg = xresources['*.foreground']
########        c.colors.statusbar.command.bg = xresources['*.background']
########        c.colors.statusbar.url.fg = xresources['*.color8']
########        c.colors.statusbar.url.hover.fg = xresources['*.color7']
########        c.colors.statusbar.url.success.http.fg = xresources['*.color8']
########        c.colors.statusbar.url.success.https.fg = xresources['*.foreground']
########        c.colors.tabs.odd.fg = xresources['*.color8']
########        c.colors.tabs.odd.bg = xresources['*.background']
########        c.colors.tabs.even.fg = xresources['*.color8']
########        c.colors.tabs.even.bg = xresources['*.background']
########        c.colors.tabs.selected.odd.fg = xresources['*.foreground']
########        c.colors.tabs.selected.odd.bg = xresources['*.background']
########        c.colors.tabs.selected.even.fg = xresources['*.foreground']
########        c.colors.tabs.selected.even.bg = xresources['*.background']
