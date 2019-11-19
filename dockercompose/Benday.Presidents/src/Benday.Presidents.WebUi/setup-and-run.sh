#!/bin/bash

echo ***
echo deploying ef migrations
./deploy-ef-migrations.sh Benday.Presidents.WebUi PresidentsDbContext
./deploy-ef-migrations.sh Benday.Presidents.WebUi ApplicationDbContext
echo ***
echo starting webui app
dotnet ./Benday.Presidents.WebUi.dll
echo webui app exited