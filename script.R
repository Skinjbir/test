# Load RSelenium library
library(RSelenium)

# Set up the Selenium remote driver with Chrome
# Assuming Selenium is running on the default port 4444
remote_driver <- remoteDriver(
  remoteServerAddr = "selenium",  # 'selenium' alias from CI configuration
  port = 4444,
  browserName = "chrome"
)

# Start the Selenium driver
remote_driver$open()

# Navigate to a webpage
url <- "https://www.example.com"
remote_driver$navigate(url)

# Extract the page title and print it
page_title <- remote_driver$getTitle()
cat("Page title:", page_title[[1]], "\n")

# Take a screenshot and save it
screenshot_file <- "screenshot.png"
remote_driver$screenshot(file = screenshot_file)
cat("Screenshot saved to", screenshot_file, "\n")

# Example of finding an element (e.g., by CSS selector) and interacting with it
# element <- remote_driver$findElement(using = "css selector", value = "body")
# cat("Page text content:", element$getElementText(), "\n")

# Close the Selenium driver
remote_driver$close()
