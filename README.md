# Random Cat Image App

A simple Flutter project that fetches and displays random cat images from **The Cat API**.  
Each time the user taps the button, a new cat image is loaded.

## Features

- Fetch random cat images using REST API  
- Display images using `Image.network`  
- Clean and simple UI  
- Demonstrates API integration + setState()  
- Beginner-friendly Flutter project  

## API Used
Base URL:  https://api.thecatapi.com
path:/v1/images/search
Full endpoint: https://api.thecatapi.com/v1/images/search

## How it works
1. User taps the floating button  
2. App sends an HTTP GET request  
3. Response contains a random cat image URL  
4. UI updates and shows the image 

