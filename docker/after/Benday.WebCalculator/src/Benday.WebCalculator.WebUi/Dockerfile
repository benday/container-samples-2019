FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-buster-slim AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.0-buster AS build
WORKDIR /src
COPY ["src/Benday.WebCalculator.WebUi/Benday.WebCalculator.WebUi.csproj", "src/Benday.WebCalculator.WebUi/"]
COPY ["src/Benday.WebCalculator.Api/Benday.WebCalculator.Api.csproj", "src/Benday.WebCalculator.Api/"]
RUN dotnet restore "src/Benday.WebCalculator.WebUi/Benday.WebCalculator.WebUi.csproj"
COPY . .
WORKDIR "/src/src/Benday.WebCalculator.WebUi"
RUN dotnet build "Benday.WebCalculator.WebUi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Benday.WebCalculator.WebUi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Benday.WebCalculator.WebUi.dll"]