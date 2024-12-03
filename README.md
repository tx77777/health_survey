# Exploring Socio-Demographic Factors Influencing Health Perceptions in Canada

## Overview

The strategic targeting of health perception variables is crucial for understanding public health outcomes across different demographics. The effective analysis of these factors can significantly improve targeted public health interventions. This study focuses on health perceptions in Canada, aiming to understand the factors influencing health perceptions from an operational perspective. By analyzing demographic factors such as age, sex, geography, and time, we identify patterns in how different groups perceive their health, providing a basis for informed health policy decisions.

We used a Bayesian linear regression model to analyze and the data is obtained from [Statistics Canada](https://www.statcan.gc.ca/en/start).


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from [Statistics Canada](https://www.statcan.gc.ca/en/start).
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper and datasheet. 
-   `scripts` contains the R scripts used to simulate, download, clean and model data.


## Statement on LLM usage

Aspects of the paper and code were written with the help of ChatGPT and the entire chat history is available in other/llm/usage.txt.
