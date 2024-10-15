library(rvest)

# URL of the Wikipedia page with CSV examples
url <- "https://en.wikipedia.org/wiki/Comma-separated_values"

# Read the webpage content
webpage <- read_html(url)

# Scrape the table containing car data
car_table <- webpage %>% html_node(xpath = '//*[@id="mw-content-text"]/div[1]/pre[1]') %>% html_text()

# Clean the scraped data (remove leading/trailing spaces, etc.)
car_data <- read.csv(text = car_table, header = TRUE)

# Save the data as CSV
write.csv(car_data, file = "car_data.csv", row.names = FALSE)

print("CSV file saved successfully.")
