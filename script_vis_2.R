library(ggplot2)
library(readr)

full_trains <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-26/full_trains.csv")

# Visualisation 2 ####
full_trains %>% 
  ggplot(aes(x = journey_time_avg)) +
  geom_histogram(bins = 20, alpha = .2)  +
  geom_histogram(data = filter(full_trains, service == "National"), 
                 aes(x = journey_time_avg),
                 bins = 20, fill = "red", alpha = .5) +
  theme(text = element_text(size = 15)) +
  labs(title = "Histogram of Average Journey Time for trains on the SNCF Network",
       subtitle = "National Service trains highlighted in red",
       x = "Journey Time (mins.)",
       y = "Number of Instances")