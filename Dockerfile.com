FROM mcr.microsoft.com/dotnet/aspnet:8.0

WORKDIR /app

RUN groupadd --gid 1000 appuser && \
useradd --uid 1000 --gid appuser --shell /bin/bash --create-home appuser

COPY --chown=appuser:appuser ./CommunicationControl/DevOpsProject/bin/Debug/net8.0/ .

USER appuser
EXPOSE 8080
ENTRYPOINT ["dotnet", "DevOpsProject.CommunicationControl.API.dll"]
