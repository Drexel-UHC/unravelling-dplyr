# 0. Setup ----------------------------------------------------------------
{
  ## Dependencies
  library(skimr) # quick eda
  library(palmerpenguins) #data
  library(tidyverse)  
  
  ## Data
  raw_data = penguins
}



# 1. EDA ------------------------------------------------------------------


# 1.1 Glimpse data --------------------------------------------------------
{
  
  glimpse(raw_data)
  
  #' Data strata
  #'  - species
  #'  - island
  #'  - sex
  #'  - year
  #'  
  #'  Data:
  #'  - bill_length_mm
  #'  - bill_depth_mm
  #'  - flipper_length_mm
  #'  - body_mass_g

}

# 1.2 Evaluate data --------------------------------------------------------
{
  skim(raw_data)
}



# 1.3 clean data ----------------------------------------------------------
{
  ## 1. make the data tidy
  data_tidy = raw_data %>% 
    pivot_longer(
      cols = c(bill_length_mm, bill_depth_mm, 
               flipper_length_mm, body_mass_g))
  glimpse(data)
  # raw_data %>% 
  #   pivot_longer(
  #     cols = c(-species, -island, -sex, -year))
  # 
  # raw_data %>% 
  #   pivot_longer(
  #     cols = c(contains("mm"), body_mass_g ))
  
  ## 2. remove missing values
  data = data_tidy %>% 
    filter(!is.na(value))
  
}


# 2. Analysis 1 -----------------------------------------------------------
#'   Prompt:  summarize (median)  body mass by island.
#'   
#'     1. group by island
#'     2. calcualte the median body mass
#'     3. selecting results of interest.
   
df1 = data %>% 
  group_by(island, name) %>%
  summarize(median_value = median(value)) 
  

df1 %>% 
  pivot_wider(
    names_from = name,
    values_from = median_value
  )

