import rosepine

config.load_autoconfig()

rosepine.setup(c, 'rose-pine-main', True)
c.fonts.default_family = "FreeMono"
c.fonts.default_size = "15pt"

# c.url.searchengines = {
#     'DEFAULT': 'https://www.google.com/search?hl=en&q={}'
# }

# c.url.start_pages = "https://www.google.com"
# c.url.default_page = "https://www.google.com"

c.content.geolocation = False
c.content.media.audio_capture = False
c.content.media.video_capture = False
c.content.notifications.enabled = False
c.content.desktop_capture = False

c.content.blocking.enabled = True
c.content.blocking.method = "auto"

config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
