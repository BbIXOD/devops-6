FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /app


RUN groupadd --gid 1000 appuser && \
    useradd --uid 1000 --gid appuser --shell /bin/bash --create-home appuser

COPY --chown=appuser:appuser ./publish .

USER appuser

EXPOSE 8080

ENTRYPOINT ["dotnet", "DevOpsProject.CommunicationControl.API.dll"]
