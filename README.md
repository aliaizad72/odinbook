# README

Odinbook is a CRUD web application that mimics common social-media applications such as Facebook or Twitter. 

Deployed on: odinbook-aliaizad.fly.dev

Odinbook is built on:
- Full-stack Ruby on Rails with Hotwire & Stimulus on the front-end.
- Tailwind CSS as the CSS framework
- PostgreSQL as the database

Features of Odinbook:
- Post text or text with image posts
- Connect with other users with a simple follow button

Lessons learned after building Odinbook:
- Setting up authentication and authorization with Devise
- Designing RESTful routes for resources
- Creating appropriate actions for HTTP request in Controllers
- Outputting and styling computed actions in Views
- The overall process of working in an MVC framework
- Styling ERB / HTML components with TailwindCSS
- Reducing response - request cycles with Turbo (Turbo Drive & Turbo Frames)
- Builidng simple event-listeners with Stimulus JS
- Declaring associations between models in an application and their respective db migrations
- Understanding how to set up a Mailer in development
- Integrating Google SMTP as the Mailer in production
- Using Active Storage to store images and avatar
- Setting up Google Cloud Storage as the location for Active Storage in production
- Managing environment variables and Rails credentials in development and production
- Setting up third-party Omniauth with Devise (e.g Google OAuth2)
- Basic understanding of Dockerfile and how to pass a secret when building an image
- The process of deploying and application to a PaaS, in this case Fly.io