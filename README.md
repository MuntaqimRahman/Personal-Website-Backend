# README

Backend API for my personal website. It contains routes for my portfolio and blog as well as some additional routes for a possible dynamic resume display.
It also contains an authentication endpoint which returns a JWT that enables me (and only me) to edit content. Only GET routes aren't protected by it.
The admin credentials are stored securely on a PostgreSQL database on Heroku and the password is even salted and hashed with bcrypt.

This lets me keep the website updated with content securely without going through the frontend.

It's hosted through Heroku here (https://muntaqim-website-backend.herokuapp.com/api/v1/[route])
