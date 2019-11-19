FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-buster-slim AS base
ARG source
ARG ConnectionStrings__default
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.0-buster AS build
ARG ConnectionStrings__default
WORKDIR /src
COPY ["src/Benday.Presidents.WebUi/Benday.Presidents.WebUi.csproj", "src/Benday.Presidents.WebUi/"]
COPY ["src/Benday.DataAccess/Benday.DataAccess.csproj", "src/Benday.DataAccess/"]
COPY ["src/Benday.Presidents.Api/Benday.Presidents.Api.csproj", "src/Benday.Presidents.Api/"]
RUN dotnet restore "src/Benday.Presidents.WebUi/Benday.Presidents.WebUi.csproj"
COPY . .
WORKDIR "/src/src/Benday.Presidents.WebUi"
RUN dotnet build "Benday.Presidents.WebUi.csproj" -c Release -o /app/build

FROM build AS publish
ARG ConnectionStrings__default
RUN dotnet publish "Benday.Presidents.WebUi.csproj" -c Release -o /app/publish

FROM base AS final
ARG ConnectionStrings__default
WORKDIR /app
COPY --from=publish /app/publish .
ADD src/Benday.Presidents.WebUi/deploy-ef-migrations.sh /app/deploy-ef-migrations.sh
ADD src/Benday.Presidents.WebUi/setup-and-run.sh /app/setup-and-run.sh

ENTRYPOINT ["dotnet", "Benday.Presidents.WebUi.dll"]