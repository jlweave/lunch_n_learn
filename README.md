</h1>

<p align="center">

  <img width="600" src="https://user-images.githubusercontent.com/108754743/222994555-63d40f38-8f96-432f-bab4-f855a9bea2c3.JPG">
</p>

<h3 align="center">This repo handles only the Back End project responsibilities. 
</h3>

## Table of Contents

- [Project Overview](#project-overview)
- [Schema](#schema)
- [Tech Stack](#tech-stack)
- [Setup and Installation](#setup-and-installation)
- [Learning Goals](#learning-goals)
- [API Information](#api-information)
- [Repository Owner](#repository-owner)

## Project Overview


This is the backend service for an application called Lunch n Learn. Lunch and Learn allows users to find recipes around the world and learn about different countries. When a user creates an account, they are able to save recipes to their favorites for later enjoyment. This project was completed as part of the backend curriculum at Turing School of Software and Design. At this time there is no frontend built.

## Schema

![Screen Shot 2023-03-06 at 7 51 09 PM](https://user-images.githubusercontent.com/108754743/223307826-7f1a6126-70f0-4450-bf68-38aa458a6bf1.png)


## API Endpoints
Here is a list of all mapped client requests with their respective json responses below them:
<details>
<summary> 'Get Recipes for a Specific Country' </summary>
<br>
  
  ![first](https://user-images.githubusercontent.com/108754743/223305573-5abd6ae4-572e-4cd6-b5da-52a8c9d7c9a9.png)
  
  ![2](https://user-images.githubusercontent.com/108754743/223305582-71baca4a-827b-4802-837b-7e528738292e.png)
  
 </details>
 
<details>
<summary> 'Get Recipes by Country' </summary>
<br>

  ![3](https://user-images.githubusercontent.com/108754743/223305591-cbba9edc-6a64-46cf-aefd-9a4a8ba6c282.png)

  ![3 5](https://user-images.githubusercontent.com/108754743/223490361-bc2e2898-ea49-42bc-b7c1-a3fe8fe48b8a.png)

</details>
  
<details>
<summary> 'Get a video for a specific Country' </summary>
<br> 
 
   ![new 4](https://user-images.githubusercontent.com/108754743/223490815-b633d3b4-9205-4e11-8ad2-513cd30c0a6c.png)

   ![4 5](https://user-images.githubusercontent.com/108754743/223305638-c590a80c-8482-43d5-9513-5c4421a53d8e.png)
  
   ![4 8](https://user-images.githubusercontent.com/108754743/223491511-0776ae3b-eeee-42f1-9207-daf29f56a01d.png)

 </details> 
 
<details>
<summary> 'Get a photo for a specific Country' </summary>
<br> 
  
  ![new5](https://user-images.githubusercontent.com/108754743/223491715-4d094e9f-c205-4f9f-8ab9-1fb79a842575.png)

  ![6](https://user-images.githubusercontent.com/108754743/223305665-0dd3b638-9eb4-4ffb-bf6b-4db35006d85e.png)
  
  ![7](https://user-images.githubusercontent.com/108754743/223305672-8c94377d-aad6-4455-958d-c19915ac4ed0.png)
  
</details> 

 <details>
  <summary> 'User Registration, Add Favorites, Get Users Favorites,' </summary>
  <br>
  https://documenter.getpostman.com/view/25513104/2s93JqRQTz
  </details>


## Tech Stack

![Lunch n Learn copy](https://user-images.githubusercontent.com/108754743/223498054-1a605abb-849e-4809-92b8-f6001c3d41c4.jpg)


## Setup and Installation

From your terminal, run:

- ```git clone git@github.com:jlweave/lunch_n_learn.git```
- ```bundle install```
- ```rails db:create```
- To run the tests: ```bundle exec rspec```
- As of right now there is no front end to view this project with

## Learning Goals

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## API Information

We are consuming several API's for this project:

Needs API key
- <a href= "https://developers.google.com/youtube/v3/getting-started">Google API </a> 
- <a href= "https://unsplash.com/join">Unsplash API</a>
- <a href= "https://developer.edamam.com/edamam-recipe-api">Edamam API</a>

Does not need an API key
- <a href= "https://restcountries.com/#api-endpoints-v3-all">Country API</a>

## Repository Owner

| [<img alt="Lacey" width="75" src="https://avatars.githubusercontent.com/u/108754743?s=400&u=b8025841efd9b890069675118a850f8a58d82ed9&v=4"/>](https://www.linkedin.com/in/lacey-weaver-be-dev/) |
 | ------------ |
 | Lacey Weaver | 
|  [LinkedIn](https://www.linkedin.com/in/lacey-weaver-be-dev/) | 
