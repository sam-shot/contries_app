
# Country App

An Interactive and Responsive App which displays a list of all countries and show details of each of the countries.


## Features

- Follows System Theme (i.e Dark/Light Theme)
- Responsive
- Give Details of All countries



![](https://img.shields.io/badge/version-1.o-brightgreen)


## Author

- [Samuel Ademujimi](https://www.github.com/sam-shot)


## Libraries I used
 
 - [http](https://pub.dev/packages/url_launcher)
    : I used this package to handle network requests.
- [carousel_slider](https://pub.dev/packages/easy_localization)
    : I used this package to implement Carousel in the country details screen to show flag and coat of arms.
## Code Base 

- lib : This folder contains the files usef for the projects.
- lib/screens : This contains each page of the App.
- lib/components : This contains some custom widgets used in the app.
- lib/models : This contains models used to get and parse json from network.
- lib/provider: This contains Theme data information.
- assets : This folder contains assets for the App.
- assets/fonts : This folder contains fonts assets.
## Features I would have Added if I had more time

- Implement dark mode toggle on button click.
- Make project Multilingual.
- Make the countries list filterable
- Handle Network errors.

## Link to App

Download App [here](https://drive.google.com/file/d/1pCi3S0DDqwd3zA8FpMd-BjPLdxSB0HRr/view?usp=share_link)


## Link to App on Appetize.io

Open [here](https://appetize.io/app/nbopeyhc42las6glhb3djvgsoi)

 


## Run Locally

Clone the project.
- Make sure you have flutter installed.
- If you don't have flutter installed, install it [here](https://flutter.dev/).


```bash
  git clone https://github.com/sam-shot/contries_app
```

Go to the project directory

```bash
  cd contries_app
```

Install dependencies

```bash
  flutter run pub get
```

Run the App

```bash
  flutter run
```


## Challenges I faced

- Getting correct models : I made sure i used a good Json to Dart converter which removed errors
- Making the App Responsive : I solved this challenge by making use of 
```
  MediaQuery.of(context).size
``` 
to get device width and render the UI in respect to the device's width

## Support

For support, email samshotmedai01@gmail.com 

