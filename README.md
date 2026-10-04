# Tow Service System

A comprehensive towing service system for FiveM servers.

## Features

- Request towing service for vehicles
- Accept and complete towing jobs
- Configurable towing settings and locations
- Database integration for tracking tow requests

## Requirements

- FiveM server
- ESX framework
- MySQL database

## Installation

1. Download the script files.
2. Place them in your FiveM server's resources folder.
3. Add `start tow-service-system` to your server.cfg file.
4. Import the database.sql file into your MySQL database.

## Usage

### Commands

- `/requesttow` - Request a tow for the vehicle you are in.
- `/accepttow [towId]` - Accept a tow request.
- `/completetow [towId]` - Complete a tow request.

### Configuration

Edit the `config.lua` file to adjust settings such as tow price, cooldown, blip sprite, and towing vehicle models.

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=tow-service-system&utm_content=bottom) — describe it in one sentence and get the full source code.

Respond with ONLY a JSON object: