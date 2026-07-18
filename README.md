# SomniVerse AI — API

A Rails API for authenticated dream journaling and AI-assisted interpretation.

The service stores a user's dream entries, supports search and lifecycle management, and creates structured interpretations through the OpenAI Assistants API.

## Features

- Devise-based user registration and authentication
- User-scoped dream records
- Search across dream descriptions
- Soft-delete and completion lifecycle
- Nested interpretation resources
- Structured AI output with meaning, tags, questions, and multiple perspectives
- PostgreSQL persistence
- Docker production image

## API outline

```text
POST   /users
POST   /users/sign_in
DELETE /users/sign_out

GET    /api/v1/dreams
POST   /api/v1/dreams
GET    /api/v1/dreams/:id
PUT    /api/v1/dreams/:id
DELETE /api/v1/dreams/:id
GET    /api/v1/dreams/search

GET    /api/v1/dreams/:dream_id/interpretations
POST   /api/v1/dreams/:dream_id/interpretations
GET    /api/v1/dreams/:dream_id/interpretations/:id
PUT    /api/v1/dreams/:dream_id/interpretations/:id
DELETE /api/v1/dreams/:dream_id/interpretations/:id
```

## Stack

- Ruby 3.2
- Rails 7.1
- PostgreSQL
- Devise
- JWT
- ruby-openai
- Docker

## Local setup

```bash
bundle install
bin/rails db:create db:migrate
bin/rails server
```

Required environment variables include:

```text
DATABASE_URL
OPENAI_KEY
ASSISTANT_ID
```

Use a local `.env` file for development and keep it out of version control.

## Related frontend

The React client lives in [VoldemLive/sbfront](https://github.com/VoldemLive/sbfront).

## Status and responsible use

This is a product prototype and portfolio code sample. Generated interpretations are reflective content, not medical advice or a clinical assessment.
