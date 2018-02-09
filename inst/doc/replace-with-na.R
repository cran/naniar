## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----create-df-----------------------------------------------------------

df <- tibble::tribble(
  ~name,           ~x,  ~y,              ~z,  
  "N/A",           1,   "N/A",           -100, 
  "N A",           3,   "NOt available", -99,
  "N / A",         NA,  29,              -98,
  "Not Available", -99, 25,              -101,
  "John Smith",    -98, 28,              -1)


## ----load-naniar---------------------------------------------------------
library(naniar)

## ----replace-with-na-ex1-------------------------------------------------
df %>% replace_with_na(replace = list(x = -99))

## ----replace-with-na-ex2-------------------------------------------------
df %>%
  replace_with_na(replace = list(x = c(-99, -98)))

## ----replace-with-na-ex3-------------------------------------------------
df %>%
  replace_with_na(replace = list(x = c(-99,-98),
                             z = c(-99, -98)))

## ----replace-with-na-all-ex1---------------------------------------------

df %>% replace_with_na_all(condition = ~.x == -99)


## ----replace-with-na-all-ex2---------------------------------------------

# write out all the offending strings
na_strings <- c("NA", "N A", "N / A", "N/A", "N/ A", "Not Available", "NOt available")

## ----replace-with-na-all-ex3---------------------------------------------

df %>%
  replace_with_na_all(condition = ~.x %in% na_strings)


## ----replace-with-na-at-ex1----------------------------------------------

df %>% 
  replace_with_na_at(.vars = c("x","z"),
                     condition = ~.x == -99)


## ----replace-with-na-at-ex2----------------------------------------------

df %>% 
  replace_with_na_at(.vars = c("x","z"),
                     condition = ~ exp(.x) < 1)

## ----replace-with-na-if-ex1----------------------------------------------

df %>%
  replace_with_na_if(.predicate = is.character,
                     condition = ~.x %in% ("N/A"))

# or
df %>%
  replace_with_na_if(.predicate = is.character,
                     condition = ~.x %in% (na_strings))


