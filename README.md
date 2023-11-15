<div align="center">

<a name="readme-top"></a>

  <h3><b>Final Capstone Back End</b></h3>

</div>

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 final\_capstone\_back\_end ](#-final_capstone_back_end-)
  - [🛠 ER Diagram ](#-er-diagram-)
  - [💻 link to front end ](#-link-to-front-end-)
  - [💻 link to Kanban board information ](#-link-to-kanban-board-information-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Database Setup](#database-setup)
    - [Usage](#usage)
  - [🔬 Running Tests ](#-running-tests-)
    - [Test Suite](#test-suite)
  - [💻 API Documentation ](#-api-documentation-)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [❓ FAQ (OPTIONAL) ](#-faq-optional-)
  - [📝 License ](#-license-)


# 📖 Final Capstone Back End <a name="about-project"></a>

**final_capstone_back_end** The back-end component of this final capstone project is developed using Ruby on Rails, configured to serve as an API. This API is designed to facilitate creation of places to rent, and to allow users to make reservations for those places. It leverages a PostgreSQL database to manage and store reservation data. The API is designed to be consumed by a front-end application, which is developed using React.js.

## 🛠 ER Diagram <a name="built-with"></a>

![ER Diagram](./src/ERD.png)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Link to front end <a name="built-with"></a>


[Link to Front End](https://github.com/grauJavier/final-capstone-front-end)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 link to Kanban board information <a name="built-with"></a>

[Link to Kanban Board](https://github.com/grauJavier/final-capstone-back-end/projects/1)

[Initial state](https://github.com/grauJavier/final-capstone-front-end/issues/38)

This project was completed by three Team members:

- Javier Grau
- Manuel Sanchez
- Anthony Vásquez

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Technologies</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>
<details>
<summary>Linters</summary>
  <ul>
    <li>Rubocop</li>
  </ul>
</details>


### Key Features <a name="key-features"></a>

- **Ruby on Rails**
- **API Endpoint**
- **Professional Documentation**
- **Linting for Code Quality**
- **Postgres Database**
- **Git Version Control**


<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps:

### Prerequisites

Before you begin, ensure you have the following prerequisites installed on your system:

- Ruby: You need Ruby to run the Ruby on Rails application.
- Bundler: Bundler is used to manage gem dependencies for your Ruby project.

### Setup

In your terminal, navigate to the folder of your choice and clone the repository with the following commands:

```sh
cd my-folder
git clone git@github.com:grauJavier/final-capstone-back-end.git

```

### Install

After cloning the project, change into the project directory:

```sh
cd final_capstone_back_end

```

Install this project with:

- gem install rails
- bundle install

### Database Setup

Create and migrate your database with:

```sh

rails db:create
rails db:migrate

```
### Usage

To run the project, execute the following command:

```sh

rails server
or
rails s

```
This should start your local server on http://localhost:3000/. Now, you can use the REST API client of your choice to interact with the API.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🔬 Running Tests <a name="running-tests"></a>

To run tests, navigate to the directory where the project is located on your machine, open your terminal, and follow these steps:

### Test Suite

This project contains a suite of unit tests which you can run to ensure everything is functioning as expected. To run these tests, you need RSpec installed.

To install RSpec if you haven't already, run:

```sh
gem install rspec

```

After you've installed RSpec, you can run the tests with:

```sh

rspec

```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 API Documentation <a name="getting-started"></a>

<div align="center">

[API Documentation](https://renteaze-d1cc8b293660.herokuapp.com/api-docs/index.html)


![API Methods](./src/API_documentation.png)

</div>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Javier Grau**

- GitHub: [@grauJavier](https://github.com/grauJavier)
- LinkedIn: [Javier Grau](https://www.linkedin.com/in/javiergrau)

👤 **Manuel Sanchez**

- GitHub: [@Luffytaro22](https://github.com/Luffytaro22)
- LinkedIn: [Manuel Sanchez](https://www.linkedin.com/in/manuel-alejandro-sanchez-sierra/)

👤 **lRebornsl**

- GitHub: [@lRebornsl](https://github.com/lRebornsl)
- Twitter: [@RebornsDev](https://twitter.com/RebornsDev)
- LinkedIn: [Anthony Vásquez](https://www.linkedin.com/in/avvm98/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🔭 Future Features <a name="future-features"></a>

- [ ] **Implement proper user authentication from the front-end to the server**
- [ ] **Add authorizations to users**


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/grauJavier/final-capstone-back-end/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ⭐️ Show your support <a name="support"></a>

If you like this project please feel free to send me corrections for make it better I would feel glad to read your comments.
And think If you enjoy gift me a star.  

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- Behance and Murat Korkmaz for the [original design](https://www.behance.net/gallery/26425031/Vespa-Responsive-Redesign)
- Microverse for providing the opportunity to learn in a collaborative environment.
- React.js Documentation for valuable resources on React development.
- GitHub for version control and collaboration tools.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ❓ FAQ (OPTIONAL) <a name="faq"></a>

- **Can I use with a templeate your project?**

  - Of course we would feel honored.

- **Your project is free license?**

  - Yeah, you can use it completely.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 📝 License <a name="license"></a>

This project is licensed under the MIT License - you can click here to have more details [MIT](./LICENSE).

<p align="right">(<a href="#readme-top">back to top</a>)</p>
